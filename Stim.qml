import Quickshell
import Quickshell.Services.UPower
import QtQuick
import "."

Item {
    id: container

    height: Etc.factor
    width: 1.32 * Etc.factor
    Rectangle {
        id: globalColor
        color: UPower.displayDevice.state == "1" ? "white" : "#404040"
    }
    
    Rectangle {
        id: needle
        height: 0.08 * Etc.factor
        width: 0.64 * Etc.factor
        anchors.verticalCenter: parent.verticalCenter
        color: globalColor.color
        Rectangle {
            width: 0.16 * Etc.factor
            height: 0.20 * Etc.factor
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            color: globalColor.color
        }
    }
    Rectangle {
        id: flask
        width: 0.80 * Etc.factor
        height: 0.36 * Etc.factor
        anchors {
            verticalCenter: parent.verticalCenter
            left: needle.right
        }
        color: globalColor.color
        // Text {
        //     anchors.horizontalCenter: parent.horizontalCenter
        //     // text: qsTr("%1h").arg(Math.round(UPower.displayDevice.timeToFull / 360))
        //     text: UPower.displayDevice.state
        //     font.pointSize: Etc.factor / 4
        //     font.family: helldiverRegular.font.family
        //     color: "black"
        // }
        Rectangle {
            width: 0.08 * Etc.factor
            height: 0.52 * Etc.factor
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            color: globalColor.color
        }
    }
    Rectangle {
        width: 0.32 * Etc.factor
        height: 0.20 * Etc.factor
        anchors {
            verticalCenter: parent.verticalCenter
            left: flask.right
        }
        color: globalColor.color
        Rectangle {
            width: 0.08 * Etc.factor
            height: 0.36 * Etc.factor
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            color: globalColor.color
        }
    }
}
