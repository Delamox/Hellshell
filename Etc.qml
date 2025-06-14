pragma Singleton

import QtQuick

QtObject {
    property int factor: 25
    property color labelColor: "#a6efff"
    property var stratagems: [
        {nr: 0, sequence: "udud", action: "screenshot", label: "EON", stratagemColor: "blue", icon: ""},
        {nr: 1, sequence: "ddlur", action: "screenshot", label: "THAW", stratagemColor: "green", icon: ""},
        {nr: 2, sequence: "urddd", action: "screenshot", label: "BLEH :3", stratagemColor: "red", icon: "power.svg"},
        {nr: 3, sequence: "uuud", action: "screenshot", label: "LUCY", stratagemColor: "yellow", icon: ""},
    ]
}
