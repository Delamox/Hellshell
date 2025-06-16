import QtQuick
import QtQuick.Shapes
import Quickshell
import Quickshell.Services.UPower
import "."

Item {
    required property string labelColor
    required property int length
    property real batteryPercentage: UPower.displayDevice.percentage
    property string batteryColor: batteryPercentage <= 0.10 ? "#ff2626" : "white"
    
    width: length
    height: Etc.factor
    anchors.verticalCenter: parent.verticalCenter

    Image {
        width: length - 0.32 * Etc.factor
        height: 0.36 * Etc.factor
        anchors.verticalCenter: parent.verticalCenter
        x: 0.16 * Etc.factor
        source: "backgroundHealthBar.svg"
        fillMode: Image.PreserveAspectCrop
        horizontalAlignment: Image.AlignRight
        clip: true
        
        Rectangle {
            id: bar
            color: batteryColor
            width: batteryPercentage == 1 ? length - 0.32 * Etc.factor : (length - 0.32 * Etc.factor) * batteryPercentage
            height: parent.height
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    Rectangle {
        width: 0.32 * Etc.factor
        height: 0.64 * Etc.factor
        color: batteryColor
        anchors.verticalCenter: parent.verticalCenter
        visible: (batteryPercentage == 1 || bar.width <= width) ? false : true
        x: bar.x + bar.width - width / 2
    }

    Rectangle {
        width: 0.08 * Etc.factor
        height: Etc.factor
        color: batteryColor
        anchors.left: parent.left
        Rectangle {
            width: parent.width
            height: 0.04 * Etc.factor
            color: batteryColor
            anchors {
                left: parent.right
                top: parent.top
            }
        }
        Rectangle {
            width: parent.width
            height: 0.04 * Etc.factor
            color: batteryColor
                anchors {
                left: parent.right
                bottom: parent.bottom
            }
        }
    }
    Rectangle {
        width: 0.08 * Etc.factor
        height: Etc.factor
        color: batteryColor
        anchors.right: parent.right
        Rectangle {
            width: parent.width
            height: 0.04 * Etc.factor
            color: batteryColor
            anchors {
                right: parent.left
                top: parent.top
            }
        }
        Rectangle {
            width: parent.width
            height: 0.04 * Etc.factor
            color: batteryColor
            anchors {
                right: parent.left
                bottom: parent.bottom
            }
        }
    }
}
