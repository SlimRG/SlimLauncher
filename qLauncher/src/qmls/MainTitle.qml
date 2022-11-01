import QtQuick
import QtQuick 2.0

import Qt5Compat.GraphicalEffects

Item{
    id:mainTitle
    anchors{
        left: parent.left
        right: parent.right
        top: parent.top
    }

    property int titleHeight: 30 // HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics\CaptionHeight

    height: mainTitle.titleHeight * 3 // 2 * HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics\CaptionHeight

    MouseArea {
        id: moveArea
        anchors{
            fill: mainTitle
            leftMargin: 5
            rightMargin: 5
            topMargin: 5
        }
        property point mPos;
        onPressed: {
            mPos = Qt.point(mouseX, mouseY)
        }
        onPositionChanged: {
            mainWindow.setX(mainWindow.x + mouseX - mPos.x)
            mainWindow.setY(mainWindow.y + mouseY - mPos.y)
        }
    }

    DropShadow {
        anchors.fill: mainTitle
        horizontalOffset: 1
        verticalOffset: 1
        radius: moveArea.pressed ? 8 : 5
        transparentBorder: true
        source: mainTitle
        color: "#80000000"
        cached: false
        Behavior on radius { PropertyAnimation { duration: 100 } }
    }
}
