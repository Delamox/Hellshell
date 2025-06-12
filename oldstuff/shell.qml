import QtQuick
import QtQuick.Shapes
import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower

// 8ea6efff

PanelWindow {
    id: root

    readonly property int textSize: 10
    readonly property int defaultBarSize: 250
    
    anchors {
        top:true
        right:true
        left:true
    }

    height: main.height + textSize / 3 * 4
    color: "transparent"

    Rectangle {
        id: health
        // y: root.height / 2 - height / 2
        height: root.height
        // color: "#80404040"
        color: "#00000000"
        width: healthBarWrapper.width + healthIndicatorWrapper.width + defaultBarSize / 10
        
        Item {
            id: healthIndicatorWrapper
            anchors {
                left: health.left
            }
            height: clock.height * 1.5
            y: clock.y
            width: leftIndicator.width + rightIndicator.width + indicator.width

            Text {
                id: percentage
                x: healthIndicatorWrapper.width / 2 - width / 2 + rightIndicator.width
                y: healthIndicatorWrapper.height / 2 - height / 2 + height * 0.05
                color: "#8ea6ef"
                font.pointSize: textSize * 1.5
                font.family: helldiversFont.font.family
                text: qsTr("%1%").arg(Math.round(UPower.displayDevice.percentage * 100))
            }

            Image {
                id: leftIndicator
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }
                source: "indicatorR.svg"
                width: 4 * rightIndicator.width
            }
            Image {
                id: indicator
                anchors {
                    left: leftIndicator.right
                    top: parent.top
                    bottom: parent.bottom
                }
                source: "indicator.svg"
                width: percentage.width * 1.2 + leftIndicator.width 
            }
            Image {
                id: rightIndicator
                anchors {
                    left: indicator.right
                    top: parent.top
                    bottom: parent.bottom
                }
                source: "indicatorR.svg"
            }
        }
        Item {
            id: healthBarWrapper
            anchors {
                right: health.right
            }
            width: leftHealth.width + rightHealth.width + (defaultBarSize - 2 * leftHealth.width)
            height: clock.height * 1.5
            y: clock.y
            Image {
                id: leftHealth
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }
                source: "healthL.svg"
            }
            Image {
                id: healthBar
                anchors {
                    left: leftHealth.right
                    top: parent.top
                    bottom: parent.bottom
                }
                source: "health.svg"
                width: (defaultBarSize - 2 * leftHealth.width) * UPower.displayDevice.percentage
            }
            Image {
                id: rightHealth
                anchors {
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                }
                source: "healthR.svg"
            }
        }
    }

    Image {
        id: main
        x: root.width / 2 - width / 2
        y: root.height / 2 - height / 2
        height: clock.height * 1.5
        width: clock.height / 2 + clock.width
        source: "main.svg"

        Behavior on width {
            NumberAnimation {
                duration: 50
            }
        }

        Text {
            id: clock
            x: main.width / 2 - width / 2
            y: main.height / 2 - height / 2 + height * 0.05
            color: "white"
            font.pointSize: textSize
            font.family: helldiversFont.font.family

            FontLoader {
                id: helldiversFont
                source: "FS Sinclair Regular.otf"
            }

            Process {
                 id: dateProc
                 command: ["date"]
                 running: true
                 stdout: SplitParser {
                     onRead: data => clock.text = data
                 }
            }
            
            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: {
                    dateProc.running = true
                }
            }
        }

        Image {
            id: rightBorder
            anchors {
                top: main.top
                left: main.right
            }

            height: main.height
            fillMode: Image.PreserveAspectFit
            source: "R.svg"
        }
        Image {
            id: leftBorder
            anchors {
                top: main.top
                right: main.left
            }

            height: main.height
            fillMode: Image.PreserveAspectFit
            source: "L.svg"
        }

    }
}
