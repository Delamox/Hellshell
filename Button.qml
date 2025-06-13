import QtQuick
import Quickshell
import "."

Item {
    width: buttonBar.width + 0.08 * Etc.factor
    height: Etc.factor

    required property string labelContent

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
        width: label.width + label.height / 2
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

            Text {
                id: label
                text: labelContent
                color: "white"
                x: parent.width / 2 - width / 2
                y: parent.height / 2 - height / 2 + height * 0.05
                font.pointSize: Etc.factor / 2
                font.family: helldiverRegular.font.family
            }
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
