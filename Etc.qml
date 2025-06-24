pragma Singleton

import QtQuick

QtObject {
    property int factor: 25
    property int margin: factor / 5
    property color labelColor: "#a6efff"
    property int workspaces: 5
    property int workspaceTransitionSpeed: 100
    property var stratagems: [
        {nr: 0, sequence: "udrlu", action: "screenshot", label: "SCREENSHOT", stratagemColor: "yellow", icon: "screenshot.svg"},
        {nr: 1, sequence: "ddlur", action: "terminal", label: "TERMINAL", stratagemColor: "blue", icon: ""},
        {nr: 2, sequence: "urddd", action: "shutdown", label: "SHUTDOWN", stratagemColor: "red", icon: "power.svg"},
        {nr: 3, sequence: "uuud", action: "browser", label: "BROWSER", stratagemColor: "green", icon: ""},
        {nr: 4, sequence: "ddudrlu", action: "files", label: "FILES", stratagemColor: "purple", icon: ""},
        {nr: 5, sequence: "dudlru", action: "steam", label: "STEAM", stratagemColor: "blue", icon: ""},
        {nr: 6, sequence: "dlruddu", action: "unbeatable", label: "UNBEATABLE", stratagemColor: "pink", icon: ""},
    ]
}
