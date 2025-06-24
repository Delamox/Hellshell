import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import "."
Item {
    anchors.centerIn: parent
    width: container.width + 0.16 * Etc.factor
    height: container.height
    required property var rootWindow

    Item {
        id: container
        anchors.centerIn: parent
        height: 0.76 * Etc.factor
        width: container.height * (SystemTray.items.values.length - 1) + container.height
        Repeater {
            id: repeater
            model: SystemTray.items
            IconImage {
                id: trayItem
                required property var modelData
                required property int index
                width: 0.76 * Etc.factor
                height: 0.76 * Etc.factor
                x: 0.76 * index * Etc.factor
                source: {
                    // stolen from sora, i dont even know what it does tbh, but i assume it fixes something lmao.
                    const icon = modelData.icon;
                    if (icon.includes("?path=")) {
                        const [name, path] = icon.split("?path=");
                        return `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`;
                    }
                    return modelData.icon;
                }

                TrayMenu {
                    id: menuItems
                    anchor.window: rootWindow
                    anchor.rect.y: rootWindow.height + 1.4 * Etc.factor
                    anchor.rect.x: rootWindow.width - 1.72 * Etc.factor - width
                    trayItem: modelData.menu
                }
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.leftButton | Qt.RightButton
                    onClicked: event => {
                        if (event.button == Qt.LeftButton) {
                            modelData.activate();
                        } else if (modelData.hasMenu) {
                            menuItems.toggle();
                        }
                    }
                }
            }
        }
    }
}
