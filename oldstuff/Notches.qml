import QtQuick
import Quickshell
import QtQuick.Shapes

PanelWindow {
    id:root
    implicitHeight: 22
    color: "transparent"
    anchors {
        top:true
        right:true
        left:true
    }
    
    Rectangle {
        id: page
        width: root.width
        height: root.height
        color: "transparent"

        Rectangle {
            id: leftBorder
            color: "blue"
            anchors {
                top: page.top
                left: page.left
            }
            width: 50
            height: root.height
        }
        
        Rectangle {
            id: rightBorder
            color: "blue"
            anchors {
                top: page.top
                right: page.right
            }
            width: 50
            height: root.height
        }

        Rectangle {
            id: leftRect
            color: "darkgray"
            anchors {
                top: page.top
                left: page.left
            }
            width: 50
            height: 20

            MouseArea {
                id: leftRectMouse
                anchors.fill: parent
                hoverEnabled: true
            }

            states: State {
                name: "hoverLeft"
                when: leftRectMouse.containsMouse == true || leftTriMouse.containsMouse == true
                PropertyChanges {
                    leftBorder {
                        width: 100
                    }
                    leftRect {
                        width: 100
                    }
                }
            }

            transitions: Transition {
                from: ""
                to: "hoverLeft"
                reversible: true
                ParallelAnimation {
                    NumberAnimation {
                        properties: "width"
                        duration: 100
                    }
                }
            }
        }
        Rectangle {
            id: rightRect
            color: "darkgray"
            anchors {
                top: page.top
                right: page.right
            }
            width: 50
            height: 20

        
            MouseArea {
                id: rightRectMouse
                anchors.fill: parent
                hoverEnabled: true
            }

            states: State {
                name: "hoverRight"
                when: rightRectMouse.containsMouse == true || rightTriMouse.containsMouse == true
                PropertyChanges {
                    rightBorder {
                        width: 100
                    }
                    rightRect {
                        width: 100
                    }
                }
            }

            transitions: Transition {
                from: ""
                to: "hoverRight"
                reversible: true
                ParallelAnimation {
                    NumberAnimation {
                        properties: "width"
                        duration: 100
                    }
                }
            }
        }

        Shape {
            id: leftTri
            anchors {
                top: page.top
                left: leftRect.right
            }

            MouseArea {
                id: leftTriMouse
                anchors.fill: parent
                hoverEnabled: true
            }


            ShapePath {
                id: leftTriShape
                strokeColor: "darkgray"
                fillColor: "darkgray"
                startX: 0; startY: 0
                PathLine { x: 20 }
                PathLine { y: 20 }
            }
        }
        Shape {
            id: rightTri
            anchors {
                top: page.top
                right: rightRect.left
            }

            MouseArea {
                id: rightTriMouse
                anchors.fill: parent
                hoverEnabled: true
            }
        
            ShapePath {
                id: rightTriShape
                strokeColor: "darkgray"
                fillColor: "darkgray"
                startX: 0; startY: 0
                PathLine { x: 20 }
                PathLine { y: 20; x: 20 }
            }
        }
    }
}
