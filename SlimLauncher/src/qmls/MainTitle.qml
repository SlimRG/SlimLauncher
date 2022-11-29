import QtQuick
import Qt5Compat.GraphicalEffects
import Custom

Item{
    // Main properties
    id:mainTitle
    height: mainWindow.titleHeight * 3

    // Anchors properties
    anchors{
        left: parent.left
        right: parent.right
        top: parent.top
    }

    // Resize properties
    MouseArea {
        id: moveArea
        visible: (!mainWindow.isFullScreen)
        anchors{
            fill: mainTitle
            leftMargin: mainWindow.titleHeight * 0.15
            rightMargin: mainWindow.titleHeight * 0.15
            topMargin: mainWindow.titleHeight * 0.15
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

    // Effects properties
    // [TODO] Переписать архаизм (Qt 6.5+)
    DropShadow {
        id: titleShadow
        visible: (!mainWindow.isFullScreen)
        anchors.fill: mainTitle
        horizontalOffset: 1
        verticalOffset: 1
        radius: moveArea.pressed ? 2 : 1
        transparentBorder: false
        source: mainTitle
        color: "gray"
        cached: false
        Behavior on radius { PropertyAnimation { duration: 100 } }
    }
}
