import QtQuick
import Quickshell
import Quickshell.Io
import "."

PopupWindow {
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
                e.arrowColor = c
            });
        });
    }
    Component.onCompleted: {
        setup();
        console.log("hii")
    }

    width: container.width
    height: 3 * 2.08 * Etc.factor + 0.36 * Etc.factor
    visible: true

    Process {
        id: shutdownProc
        command: ["systemctl", "poweroff"]
        running: false
    }
    
    Rectangle {
        id: container
        width: sq1.width * 6
        height: parent.height
        color: "#404040"
        focus: true

        Keys.onPressed: (event)=> {
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
                var deleteBuffer = [];

                deleteBuffer = strata.filter(doesNotStartsWith);
                strata = strata.filter(startsWith);
                clear(deleteBuffer, "gray")
            
                if (strata.length == 0) {
                    setup();
                }

                if (buffer.length != 0) {
                    strata.forEach((element) => {
                        element.head.arrowColor = "gray";
                        element.head = element.head.children[1];

                        if (element.seq == buffer) {
                            if (element.act == "shutdown") {
                                shutdownProc.running = true;
                            }
                            setup();
                        } else {
                            element.head.arrowColor = "white";
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
            height: 1.72 * Etc.factor
            width: 1.72 * Etc.factor
            x: 0.36 * Etc.factor
            y: 0.36 * Etc.factor
            Rectangle {
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                height: 1.56 * Etc.factor
                width: 1.56 * Etc.factor
            }
            Seq1 {
                id: seq1
                x: 0.72 * Etc.factor + parent.width
            }
        }
        Rectangle {
            id: sq2
            color: "red"
            height: 1.72 * Etc.factor
            width: 1.72 * Etc.factor
            x: 0.36 * Etc.factor
            y: sq1.height + sq1.y + 0.36 * Etc.factor
            Rectangle {
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                height: 1.56 * Etc.factor
                width: 1.56 * Etc.factor
            }
            Seq2 {
                id: seq2
                x: 0.72 * Etc.factor + parent.width
            }
        }
        Rectangle {
            id: sq3
            color: "blue"
            height: 1.72 * Etc.factor
            width: 1.72 * Etc.factor
            x: 0.36 * Etc.factor
            y: sq2.height + sq2.y + 0.36 * Etc.factor
            Rectangle {
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                height: 1.56 * Etc.factor
                width: 1.56 * Etc.factor
            }
            Seq3 {
                id: seq3
                x: 0.72 * Etc.factor + parent.width
            }
        }
    }
}
