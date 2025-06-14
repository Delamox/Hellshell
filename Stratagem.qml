import QtQuick
import "."

Rectangle {
    required property var settings
    color: settings.stratagemColor
    
    height: 1.72 * Etc.factor
    width: 1.72 * Etc.factor
    x: 0.36 * Etc.factor
    y: 0.36 * Etc.factor + 2.08 * settings.nr * Etc.factor
    Rectangle {
        color: "black"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        height: 1.56 * Etc.factor
        width: 1.56 * Etc.factor
    }
}
