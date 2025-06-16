import QtQuick
import Quickshell.Hyprland
import "."
Item {
    property int active: Hyprland.focusedWorkspace?.id - 1

    anchors.centerIn: parent
    width: container.width + 0.16 * Etc.factor
    height: container.height

    Item {
        id: container
        anchors.centerIn: parent
        height: 0.76 * Etc.factor
        width: container.height * 2 * repeater.model + container.height
        Repeater {
            id: repeater
            model: Etc.workspaces
            Item {
                required property var modelData
                id: notch

                property int base: 1.52 * Etc.factor * modelData + 0.38 * Etc.factor
                property int widthAbstraction: (modelData == active) ? Etc.factor * 1.52 : Etc.factor * 0.76

                anchors.verticalCenter: container.verticalCenter
                x: (modelData > active) ? base + widthAbstraction : base
                width: widthAbstraction
                height: 0.76 * Etc.factor
                Behavior on width {
                    NumberAnimation {
                        duration: Etc.workspaceTransitionSpeed
                    }
                }
                Behavior on x {
                    NumberAnimation {
                        duration: Etc.workspaceTransitionSpeed
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        Hyprland.dispatch(`workspace ${modelData + 1}`);
                    }
                }
            
                Rectangle {
                    id: indicator
                    anchors.centerIn: parent
                    width: (modelData == active) ? Etc.factor * 1.2 : 0.44 * Etc.factor
                    height: 0.44 * Etc.factor
                    visible: (modelData == active) ? true : false 

                    Behavior on width {
                        NumberAnimation {
                            duration: Etc.workspaceTransitionSpeed
                        }
                    }
                }
                Rectangle {
                    height: parent.height
                    width: 0.04 * Etc.factor
                }
                Rectangle {
                    height: parent.height
                    width: 0.04 * Etc.factor
                    anchors.right: parent.right
                }
                Rectangle {
                    width: 0.34 * parent.height
                    height: 0.04 * Etc.factor
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                 }
                Rectangle {
                    width: 0.34 * parent.height
                    height: 0.04 * Etc.factor
                    anchors.bottom: parent.bottom
                    anchors.right: notch.right
                }
                Rectangle {
                    width: 0.34 * parent.height
                    height: 0.04 * Etc.factor
                    anchors.left: parent.left
                    anchors.top: parent.top
                }
                Rectangle {
                    width: 0.34 * parent.height
                    height: 0.04 * Etc.factor
                    anchors.top: parent.top
                    anchors.right: notch.right
                }
            }
        }
    }
}
