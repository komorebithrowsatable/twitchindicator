import QtQuick 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

MouseArea {
    height: 42
    width: 42
    property alias icon: image.source 

    PlasmaCore.IconItem {
        id: image
        anchors.fill: parent
    }
}