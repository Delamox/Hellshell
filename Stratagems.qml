import QtQuick
import Quickshell
import QtMultimedia
import Quickshell.Io
import "."

PopupWindow {
    property string buffer: ""
    property var sequences: []
    property var strata: []
    property var dashSFX: [dash1, dash2, dash3]
    property var failSFX: [fail1, fail2, fail3]
    property string action
    property int lastSFX: 0
    id: root
    
    implicitWidth: 12.48 * Etc.factor
    implicitHeight: Etc.stratagems.length * 2.08 * Etc.factor + 0.36 * Etc.factor
    color: "#404040"

    Component.onCompleted: {
        setup()
    }
    function largest() {
    }
    function setup() {
        Etc.stratagems.forEach((element) => {
            var arrowRepeater = stratagems.itemAt(element.nr).children[stratagems.itemAt(element.nr).children.length - 1]
            var labelText = stratagems.itemAt(element.nr).children[1]
            sequences.push({sequence: element.sequence, action: element.action, head: 0, size: element.sequence.length, arrowRepeater: arrowRepeater, labelText: labelText})
        });
        reset()
    }
    function reset() {
        sequences.forEach((element) => {
            clean(element, "lightgray")
            element.head = 0
        })
        strata = clone(sequences)
        buffer = "";
    }
    function clean(e, c) {
        e.labelText.color = c
        for (let i = 0; i < e.size; i++) {
            e.arrowRepeater.itemAt(i).arrowColor = c
        }
    }
    function clone(e) {
        return e
    }
    function keyHandler(event) {
        if (event.key == 16777235 || event.key == Qt.Key_W){
            buffer = buffer + "u"
            input();
        } else if (event.key == 16777237 || event.key == Qt.Key_S){
            buffer = buffer + "d"
            input();
        } else if (event.key == 16777234 || event.key == Qt.Key_A){
            buffer = buffer + "l"
            input();
        } else if (event.key == 16777236 || event.key == Qt.Key_D){
            buffer = buffer + "r"
            input();
        }
    }
    function input() {
        strata.filter(doesNotStartsWith).forEach((element) => {clean(element, "gray")})
        strata = strata.filter(startsWith);
        if (lastSFX == 2) {
            lastSFX = 0
        } else {
            lastSFX++
        }

        if (strata.length == 0) {
            failSFX[lastSFX].play();
            reset();
            // root.visible = false
        }

        if (buffer.length != 0) {
            dashSFX[lastSFX].play();
            strata.forEach((element) => {
                element.arrowRepeater.itemAt(element.head).arrowColor = "gray"
                element.head = element.head + 1

                if (element.sequence == buffer) {
                    // action = element.action;
                    test.running = true;
                    // actProc.running = true;
                    // console.log(actProc.command);
                    reset();
                    // root.visible = false
                } else {
                element.arrowRepeater.itemAt(element.head).arrowColor = "white"
                }
            });
        }
    }

    SoundEffect {
        id: dash1
        source: "sfx/dash1.wav"
    }
    SoundEffect {
        id: dash2
        source: "sfx/dash2.wav"
    }
    SoundEffect {
        id: dash3
        source: "sfx/dash3.wav"
    }
    SoundEffect {
        id: fail1
        source: "sfx/fail1.wav"
    }
    SoundEffect {
        id: fail2
        source: "sfx/fail2.wav"
    }
    SoundEffect {
        id: fail3
        source: "sfx/fail3.wav"
    }

    // Process {
    //     id: actProc
    //     running: false
    //     command: ["/home/del/git/Hellshell/commands.sh", "screenshot"]
    // }
    Process {
        id: test
        running: false
        // command: ["/home/del/git/Hellshell/commands.sh", "screenshot"]
        command: ["kitty"]
    }
    
    function startsWith(value) {
        return value.sequence.startsWith(buffer)
    }
    function doesNotStartsWith(value) {
        return !(value.sequence.startsWith(buffer))
    }

    function letterToDirection(e) {
        switch (e) {
            case "u":
                return 0
            case "r":
                return 90
            case "d":
                return 180
            case "l":
                return 270
        }
    }

    function arrowSequence(e) {
        var array = [];
        e.sequence.split('').forEach((element, index) => {
            array.push({direction: letterToDirection(element), index: index});
        });
        return array
    }

    
    Rectangle {
        anchors.fill: parent
        focus: true
        color: "transparent"
        
        Keys.onPressed: (event) => {
            keyHandler(event);
        }
            
        Repeater {
            id: stratagems
            model: Etc.stratagems
            Stratagem {
                required property var modelData
                settings: modelData
                Repeater {
                    id: arrows
                    model: arrowSequence(modelData)
                    Arrow {
                        required property var modelData
                        settings: modelData
                    }
                }
            }
        }
    }
}
