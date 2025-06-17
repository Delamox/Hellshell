//@ pragma UseQApplication

import QtQuick
import QtQuick.Shapes
import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import "."


PanelWindow {
    id: root

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        // hoverEnabled: true
        onClicked: (strataContainer.visible) ? strataContainer.visible = false : strataContainer.visible = true
    }
    anchors {
        top:true
        right:true
        left:true
    }

    FontLoader {
        id: helldiverRegular
        source: "Helldiver_regular.otf"
    }

    color: "#00000000"
    implicitHeight: Etc.factor + Etc.margin * 2
    focusable: true

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        HealthBar {
            id: healthBar
            length: 8 * Etc.factor
            labelColor: "white"
            x: playerLabel.width + Etc.factor
        }

        PlayerLabel {
            id: playerLabel
            x: Etc.margin
        }
    
        Stratagems {
            id: strataContainer
            anchor.window: root
            anchor.rect.y: root.height + 1.4 * Etc.factor
            anchor.rect.x: 1.72 * Etc.factor
        }

        Stim {
            x: playerLabel.width + healthBar.width + 2 * Etc.factor
        }

        Button {
            x: root.width / 2 - width / 2
            labelHeight: workspaces.height
            labelWidth: workspaces.width
            height: Etc.factor
            Workspaces {
                id: workspaces
            }
        }

        Button {
            x: root.width - width - Etc.margin * 2 - clock.width
            labelHeight: tray.height
            labelWidth: tray.width
            height: Etc.factor
            Tray {
                id: tray
            }
        }

        Button {
            id: clock
            x: root.width - width - Etc.margin
            labelHeight: buttonLabel.height
            labelWidth: buttonLabel.width
            height: Etc.factor
            Text {
                id: buttonLabel
                text: Time.time
                color: "white"
                x: parent.width / 2 - width / 2
                y: parent.height / 2 - height / 2 + height * 0.05
                font.pointSize: Etc.factor / 2
                font.family: helldiverRegular.font.family
            }
        }
    }
}
