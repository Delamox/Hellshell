import QtQuick
import QtQuick.Shapes
import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower


PanelWindow {
    id: root

    property int barHeight: 50
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
    height: barHeight + 10

    HealthBar {
        factor: barHeight
        length: 8 * barHeight
        labelColor: "white"
        x: 2.5 * barHeight + margin
        anchors.verticalCenter: parent.verticalCenter
    }

    PlayerLabel {
        factor: barHeight
        labelColor: "#a6efff"
        x: margin
        anchors.verticalCenter: parent.verticalCenter
    }
    
    Stratagems {
        anchor.window: root
        anchor.rect.y: root.height
        factor: barHeight
    }
    focusable: true
    // Stratagems {
    //     factor: barHeight
    // }

    Stim {
        factor: barHeight
        x: barHeight * 11 + margin
        anchors.verticalCenter: parent.verticalCenter
    }

    Button {
        factor: barHeight
        labelContent: Time.time
        x: root.width - width - margin
        anchors.verticalCenter: parent.verticalCenter
    }
    
}
