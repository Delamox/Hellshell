import QtQuick
import QtQuick.Shapes
import Quickshell
import Quickshell.Services.UPower

Item {
    id: container

    required property int factor
    required property string labelColor

    width: playerLabelBar.width + 0.20 * factor
    height: playerLabelBar.height


    Rectangle {
        id: playerLabelLeftBracket
        width: 0.16 * factor
        height: factor
        color: labelColor
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: playerLabelBar.left
        }
    }
    Rectangle {
        id: playerLabelRightBracket
        width: 0.04 * factor
        height: factor
        color: labelColor
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: playerLabelBar.right
        }
    }
    
    Item {
        id: playerLabelBar
        width: label.width + label.height / 2
        height: factor
        x: 0.16 * factor

        Rectangle {
            id: playerLabelTopBracket
            width: parent.width
            height: 0.04 * factor
            color: labelColor
        }
        
        Rectangle {
            id: playerLabelBottomBracket
            width: parent.width
            height: 0.04 * factor
            y: factor - height
            color: labelColor
        }

        Text {
            id: label
            text: qsTr("%1%").arg(Math.round(UPower.displayDevice.percentage * 100))
            color: labelColor
            x: parent.width / 2 - width / 2
            y: parent.height / 2 - height / 2 + height * 0.05
            font.pointSize: factor / 2
            font.family: helldiverRegular.font.family
        }
    }
}
