import QtQuick
import Quickshell
import Quickshell.Io

PopupWindow {
    required property int factor

    property string buffer: ""
    property variant strata
    function defineStrata() {
        strata = [
            {seq: "udrlu", len: 5, act: "yeyy :3", head: seq1, res: []},
            {seq: "ddlrlr", len: 6, act: "yoooeoeyy :3", head: seq2, res: []},
            {seq: "urddd", len: 5, act: "shutdown", head: seq3, res: []},
        ]
    }
    function setup() {
        defineStrata();
        strata.forEach((element) => {
            element.res = children(element.head, [])
        });
        clear(strata, "lightgray")
        buffer = "";
    }
    function children(e, arr) {
        if (e.children.length == 2) {
            arr = children(e.children[1], arr); 
        }
        arr.push(e)
        return arr
    }
    function clear(e, c) {
        e.forEach((element) => {
            element.res.forEach((e) => {
                e.color = c
            });
        });
    }
    Component.onCompleted: {
        setup();
        console.log("hii")
    }
    width: 8.0 * factor
    height: 3 * 1.04 * factor + 0.18 * factor
    visible: true

    Process {
        id: shutdownProc
        command: ["systemctl", "poweroff"]
        running: false
    }
    
    Rectangle {
        id: container
        width: parent.width
        height: parent.height
        color: "#404040"
        focus: true
        Text {
            id: text
        }

        Keys.onPressed: (event)=> {
            console.log("bbrraew");
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
            function input() {
                text.text = buffer;
                var deleteBuffer = [];

                deleteBuffer = strata.filter(doesNotStartsWith);
                strata = strata.filter(startsWith);
                clear(deleteBuffer, "gray")
            
                if (strata.length == 0) {
                    text.text = "WRONG IDIOT";
                    setup();
                }

                if (buffer.length != 0) {
                    strata.forEach((element) => {
                        element.head.color = "lightgray";
                        element.head = element.head.children[1];

                        if (element.seq == buffer) {
                            text.text = element.act
                            if (element.act == "shutdown") {
                                shutdownProc.running = true;
                            }
                            setup();
                        } else {
                            element.head.color = "white";
                        }
                    });
                }
            }

            function startsWith(value) {
                return value.seq.startsWith(buffer)
            }
            function doesNotStartsWith(value) {
                return !(value.seq.startsWith(buffer))
            }
        
        }
        
        Rectangle {
            id: sq1
            color: "yellow"
            height: 0.86 * factor
            width: 0.86 * factor
            x: 0.18 * factor
            y: 0.18 * factor
            Rectangle {
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                height: 0.78 * factor
                width: 0.78 * factor
            }
            Seq1 {
                id: seq1
                x: parent.width + 0.48 * factor
                anchors.verticalCenter: parent.verticalCenter
                width: 0.32 * factor
                height: 0.32 * factor
            }
        }
        Rectangle {
            id: sq2
            color: "red"
            height: 0.86 * factor
            width: 0.86 * factor
            x: 0.18 * factor
            y: sq1.height + sq1.y + 0.18 * factor
            Rectangle {
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                height: 0.78 * factor
                width: 0.78 * factor
            }
            Seq2 {
                id: seq2
                x: parent.width + 0.48 * factor
                anchors.verticalCenter: parent.verticalCenter
                width: 0.32 * factor
                height: 0.32 * factor
            }
        }
        Rectangle {
            id: sq3
            color: "blue"
            height: 0.86 * factor
            width: 0.86 * factor
            x: 0.18 * factor
            y: sq2.height + sq2.y + 0.18 * factor
            Rectangle {
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                height: 0.78 * factor
                width: 0.78 * factor
            }
            Seq3 {
                id: seq3
                x: parent.width + 0.48 * factor
                anchors.verticalCenter: parent.verticalCenter
                width: 0.32 * factor
                height: 0.32 * factor
            }
        }
    }
}
