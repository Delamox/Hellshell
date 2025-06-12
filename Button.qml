import QtQuick
import Quickshell

Item {
    width: buttonBar.width + 0.08 * factor
    height: factor

    required property int factor
    required property string labelContent

    Item {
        id: buttonLeftBar
        anchors.left: parent.left
        width: 0.04 * factor
        height: factor
        Rectangle {
            width: parent.width
            height: 0.34 * factor
            color: "white"
            Rectangle {
                width: parent.width
                height: parent.height
                color: parent.color
                y: 0.66 * factor
            }
        }
    }
    Item {
        id: buttonBar
        width: label.width + label.height / 2
        height: factor
        x: 0.04 * factor
        Rectangle {
            width: parent.width
            height: 0.04 * factor
            color: "white"
        }
        Rectangle {
            width: parent.width
            height: 0.04 * factor
            y: factor - height
            color: "white"
        }
        Rectangle {
            width: parent.width - 0.16 * factor
            height: 0.76 * factor
            x: 0.08 * factor
            y: 0.12 * factor
            color: "#80404040"

            Text {
                id: label
                text: labelContent
                color: "white"
                x: parent.width / 2 - width / 2
                y: parent.height / 2 - height / 2 + height * 0.05
                font.pointSize: factor / 2
                font.family: helldiverRegular.font.family
            }
        }
    }
    Item {
        id: buttonRightBar
        anchors.right: parent.right
        width: 0.04 * factor
        height: factor
        Rectangle {
            width: parent.width
            height: 0.34 * factor
            color: "white"
            Rectangle {
                width: parent.width
                height: parent.height
                color: parent.color
                y: 0.66 * factor
            }
        }
    }
}
