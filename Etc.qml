pragma Singleton

import QtQuick

QtObject {
    property int factor: 50
    property color labelColor: "#a6efff"
    property var stratagems: [
        {nr: 0, sequence: "udud", action: "", label: "BLEH :3", stratagemColor: "blue", icon: ""},
        {nr: 1, sequence: "ddlur", action: "", label: "GIRLS KISSING !!", stratagemColor: "green", icon: ""},
        {nr: 2, sequence: "urddd", action: "shutdown", label: "SHUTDOWN", stratagemColor: "red", icon: "power.svg"},
        {nr: 3, sequence: "uuud", action: "", label: ":3", stratagemColor: "yellow", icon: ""},
        {nr: 4, sequence: "ddudrlu", action: "", label: "HIII :>", stratagemColor: "purple", icon: ""},
    ]
}
