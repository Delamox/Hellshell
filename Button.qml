import QtQuick
import Quickshell
import "."

Item {
    width: buttonBar.width + 0.08 * Etc.factor
    anchors.verticalCenter: parent.verticalCenter

    required property int labelHeight
    required property int labelWidth

    Item {
        id: buttonLeftBar
        anchors.left: parent.left
        width: 0.04 * Etc.factor
        height: Etc.factor
        Rectangle {
            width: parent.width
            height: 0.34 * Etc.factor
            color: "white"
            Rectangle {
                width: parent.width
                height: parent.height
                color: parent.color
                y: 0.66 * Etc.factor
            }
        }
    }
    Item {
        id: buttonBar
        width: labelWidth + labelHeight
        height: Etc.factor
        x: 0.04 * Etc.factor
        Rectangle {
            width: parent.width
            height: 0.04 * Etc.factor
            color: "white"
        }
        Rectangle {
            width: parent.width
            height: 0.04 * Etc.factor
            y: Etc.factor - height
            color: "white"
        }
        Rectangle {
            width: parent.width - 0.16 * Etc.factor
            height: 0.76 * Etc.factor
            x: 0.08 * Etc.factor
            y: 0.12 * Etc.factor
            color: "#80404040"

        }
    }
    Item {
        id: buttonRightBar
        anchors.right: parent.right
        width: 0.04 * Etc.factor
        height: Etc.factor
        Rectangle {
            width: parent.width
            height: 0.34 * Etc.factor
            color: "white"
            Rectangle {
                width: parent.width
                height: parent.height
                color: parent.color
                y: 0.66 * Etc.factor
            }
        }
    }
}
