import QtQuick
import QtQuick.Shapes
import "."

Item {
    required property string a
    required property int r
    property string arrowColor
    width: 0.64 * Etc.factor
    height: 0.64 * Etc.factor
    x: 0.84 * Etc.factor
    anchors.verticalCenter: parent.verticalCenter
    Item {
        width: parent.width
        height: parent.height
        rotation: r
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
}
