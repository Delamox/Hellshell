import Quickshell
import Quickshell.Services.UPower
import QtQuick

Item {
    id: container

    required property int factor
    height: factor
    Rectangle {
        id: globalColor
        color: UPower.displayDevice.state == "1" ? "white" : "#404040"
    }
    
    Rectangle {
        id: needle
        height: 0.08 * factor
        width: 0.64 * factor
        anchors.verticalCenter: parent.verticalCenter
        color: globalColor.color
        Rectangle {
            width: 0.16 * factor
            height: 0.20 * factor
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            color: globalColor.color
        }
    }
    Rectangle {
        id: flask
        width: 0.80 * factor
        height: 0.36 * factor
        anchors {
            verticalCenter: parent.verticalCenter
            left: needle.right
        }
        color: globalColor.color
        // Text {
        //     anchors.horizontalCenter: parent.horizontalCenter
        //     // text: qsTr("%1h").arg(Math.round(UPower.displayDevice.timeToFull / 360))
        //     text: UPower.displayDevice.state
        //     font.pointSize: factor / 4
        //     font.family: helldiverRegular.font.family
        //     color: "black"
        // }
        Rectangle {
            width: 0.08 * factor
            height: 0.52 * factor
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            color: globalColor.color
        }
    }
    Rectangle {
        width: 0.32 * factor
        height: 0.20 * factor
        anchors {
            verticalCenter: parent.verticalCenter
            left: flask.right
        }
        color: globalColor.color
        Rectangle {
            width: 0.08 * factor
            height: 0.36 * factor
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            color: globalColor.color
        }
    }
}
