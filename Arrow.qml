import QtQuick

Item {
    property string arrowColor
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    Rectangle {
        color: "red"
        height: 0.75 * parent.height
        width: 0.5 * parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }
    Rectangle {
        color: arrowColor
        height: 0.25 * parent.height
        width: 1 * parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
    }
}
