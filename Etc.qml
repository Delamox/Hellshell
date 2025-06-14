pragma Singleton

import QtQuick

QtObject {
    property int factor: 25
    property color labelColor: "#a6efff"
    property var stratagems: [
        {nr: 0, sequence: "udud", action: "screenshot", stratagemColor: "blue"},
        {nr: 1, sequence: "ddlur", action: "screenshot", stratagemColor: "green"},
        {nr: 2, sequence: "urddd", action: "screenshot", stratagemColor: "red"},
    ]
}
