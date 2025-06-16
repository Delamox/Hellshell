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
            length: 8 * Etc.factor
            labelColor: "white"
            x: 3 * Etc.factor + Etc.margin
        }

        PlayerLabel {
            x: Etc.margin
        }
    
        Stratagems {
            id: strataContainer
            anchor.window: root
            anchor.rect.y: root.height
        }

        Stim {
            x: Etc.factor * 11.5 + Etc.margin
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
