import QtQuick
import QtQuick.Shapes
import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import "."


PanelWindow {
    id: root

    property int margin: 5
    
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
    height: Etc.factor + 10

    HealthBar {
        length: 8 * Etc.factor
        labelColor: "white"
        x: 2.5 * Etc.factor + margin
        anchors.verticalCenter: parent.verticalCenter
    }

    PlayerLabel {
        x: margin
        anchors.verticalCenter: parent.verticalCenter
    }
    
    Stratagems {
        anchor.window: root
        anchor.rect.y: root.height
    }
    focusable: true

    Stim {
        x: Etc.factor * 11 + margin
        anchors.verticalCenter: parent.verticalCenter
    }

    Button {
        labelContent: Time.time
        x: root.width - width - margin
        anchors.verticalCenter: parent.verticalCenter
    }
    
}
