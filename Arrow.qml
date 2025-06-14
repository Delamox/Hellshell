import QtQuick
import QtQuick.Shapes
import "."

Item {
    required property var settings
    property string arrowColor: "lightgray"
    width: 0.44 * Etc.factor
    height: 0.44 * Etc.factor
    rotation: settings.direction
    x: 2 * width * settings.index + 2.04 * Etc.factor
    y: parent.height - 0.76 * Etc.factor
    Rectangle {
        id: stick
        width: parent.width * 0.5
        height: parent.height * 0.5
        color: arrowColor
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
    }
    Shape {
        id: arrHead
        width: parent.width * 1
        height: parent.height * 0.5
        anchors {
            bottom: stick.top
        }
        ShapePath {
            strokeWidth: 0
            strokeColor: arrowColor
            fillColor: arrowColor
            startX: 0; startY: arrHead.height
            PathLine { x: arrHead.width / 2; relativeY: -1 * arrHead.height }
            PathLine { relativeX: arrHead.width / 2; relativeY: arrHead.height }
        }
    }
}
