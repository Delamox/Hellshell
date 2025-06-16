import Quickshell
import QtQuick
import Quickshell.Io

PanelWindow {
    anchors {
        right: true
        left: true
        top: true
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            test.running = true
        }
    }
    Process {
        id: test
        running: false
        command: ["bash", "-c", "'nohup kitty > /dev/null 2>&1 & disown'"]
    }
}
