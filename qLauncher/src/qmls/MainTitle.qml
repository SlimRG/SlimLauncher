import QtQuick
import QtQuick 2.0

import Qt5Compat.GraphicalEffects

import Custom

Item{
    id:mainTitle
    anchors{
        left: parent.left
        right: parent.right
        top: parent.top
    }

    height: mainWindow.titleHeight * 3

    MouseArea {
        id: moveArea
        visible: (mainWindow.visibility != Window.FullScreen)
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
        id: titleShadow
        visible: (mainWindow.visibility != Window.FullScreen)
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
