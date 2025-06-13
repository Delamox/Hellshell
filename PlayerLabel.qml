import QtQuick
import QtQuick.Shapes
import Quickshell
import Quickshell.Services.UPower
import "."

Item {
    id: container

    width: playerLabelBar.width + 0.20 * Etc.factor
    height: playerLabelBar.height


    Rectangle {
        id: playerLabelLeftBracket
        width: 0.16 * Etc.factor
        height: Etc.factor
        color: Etc.labelColor
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: playerLabelBar.left
        }
    }
    Rectangle {
        id: playerLabelRightBracket
        width: 0.04 * Etc.factor
        height: Etc.factor
        color: Etc.labelColor
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: playerLabelBar.right
        }
    }
    
    Item {
        id: playerLabelBar
        width: label.width + label.height / 2
        height: Etc.factor
        x: 0.16 * Etc.factor

        Rectangle {
            id: playerLabelTopBracket
            width: parent.width
            height: 0.04 * Etc.factor
            color: Etc.labelColor
        }
        
        Rectangle {
            id: playerLabelBottomBracket
            width: parent.width
            height: 0.04 * Etc.factor
            y: Etc.factor - height
            color: Etc.labelColor
        }

        Text {
            id: label
            text: qsTr("%1%").arg(Math.round(UPower.displayDevice.percentage * 100))
            color: Etc.labelColor
            x: parent.width / 2 - width / 2
            y: parent.height / 2 - height / 2 + height * 0.05
            font.pointSize: Etc.factor / 2
            font.family: helldiverRegular.font.family
        }
    }
}
