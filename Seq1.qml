import QtQuick

Rectangle {
    Text {
        text: "u"
    }
    Rectangle {
        width: parent.height
        height: parent.height
        anchors.left: parent.right
        Text {
            text: "d"
        }
        Rectangle {
            width: parent.height
            height: parent.height
            anchors.left: parent.right
            Text {
                text: "r"
            }
            Rectangle {
                width: parent.height
                height: parent.height
                anchors.left: parent.right
                Text {
                    text: "l"
                }
                Rectangle {
                    width: parent.height
                    height: parent.height
                    anchors.left: parent.right
                    Text {
                        text: "u"
                    }
                }
            }
        }
    }
}
