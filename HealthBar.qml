import QtQuick
import QtQuick.Shapes
import Quickshell
import Quickshell.Services.UPower

Item {
    required property int factor
    required property string labelColor
    required property int length
    property real batteryPercentage: UPower.displayDevice.percentage
    property string batteryColor: batteryPercentage <= 0.10 ? "#ff2626" : "white"
    
    width: length
    height: factor

    Image {
        width: length - 0.32 * factor
        height: 0.36 * factor
        anchors.verticalCenter: parent.verticalCenter
        x: 0.16 * factor
        source: "svg/backgroundHealthBar.svg"
        fillMode: Image.PreserveAspectCrop
        horizontalAlignment: Image.AlignRight
        clip: true
        
        Rectangle {
            id: bar
            color: batteryColor
            width: batteryPercentage == 1 ? length - 0.32 * factor : (length - 0.32 * factor) * batteryPercentage
            height: parent.height
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    Rectangle {
        width: 0.32 * factor
        height: 0.64 * factor
        color: batteryColor
        anchors.verticalCenter: parent.verticalCenter
        visible: (batteryPercentage == 1 || bar.width <= width) ? false : true
        x: bar.x + bar.width - width / 2
    }

    Rectangle {
        width: 0.08 * factor
        height: factor
        color: batteryColor
        anchors.left: parent.left
        Rectangle {
            width: parent.width
            height: 0.04 * factor
            color: batteryColor
            anchors {
                left: parent.right
                top: parent.top
            }
        }
        Rectangle {
            width: parent.width
            height: 0.04 * factor
            color: batteryColor
                anchors {
                left: parent.right
                bottom: parent.bottom
            }
        }
    }
    Rectangle {
        width: 0.08 * factor
        height: factor
        color: batteryColor
        anchors.right: parent.right
        Rectangle {
            width: parent.width
            height: 0.04 * factor
            color: batteryColor
            anchors {
                right: parent.left
                top: parent.top
            }
        }
        Rectangle {
            width: parent.width
            height: 0.04 * factor
            color: batteryColor
            anchors {
                right: parent.left
                bottom: parent.bottom
            }
        }
    }
}
