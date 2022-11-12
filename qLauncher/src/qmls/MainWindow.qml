import QtQuick
import QtQuick 2.15
import QtQuick.Controls.Material 2.3

import Custom

Window {
    id: mainWindow
    visible: true
    flags: Qt.Window | Qt.FramelessWindowHint
    color: "transparent"

    //property int themeMode: PlatformToolsQML.themeMode
    property int titleHeight: PlatformToolsQML.captionHeight

    width: PlatformToolsQML.getFrameSize.x
    height: PlatformToolsQML.getFrameSize.y

    minimumWidth: PlatformToolsQML.getFrameMinSize.x
    minimumHeight: PlatformToolsQML.getFrameMinSize.y

    property color colorActiveWindow: PlatformToolsQML.colorActiveWindow
    property color colorBorderWindow: PlatformToolsQML.colorBorderWindow

    property int cornerRadiusTopLevel: PlatformToolsQML.cornerRadiusTopLevel
    property int borderWidthWindow: PlatformToolsQML.borderWidthWindow

    property bool isFullScreen: (mainWindow.visibility === Window.FullScreen)

    property point startMousePos
    property point startWindowPos
    property size startWindowSize

    function absoluteMousePos(mouseArea) {
        var windowAbs = mouseArea.mapToItem(null, mouseArea.mouseX, mouseArea.mouseY)
        return Qt.point(windowAbs.x + mainWindow.x,
                        windowAbs.y + mainWindow.y)
    }

    MouseArea {
        id: leftArea
        anchors{
            top: parent.top
            topMargin: mainWindow.titleHeight * 1.5
            bottom: parent.bottom
            bottomMargin: mainWindow.titleHeight * 0.15
            left: parent.left
        }
        width: mainWindow.titleHeight * 0.15
        cursorShape: Qt.SizeHorCursor
        visible: (!mainWindow.isFullScreen)
        onPressed: {
            startMousePos = absoluteMousePos(leftArea)
            startWindowPos = Qt.point(mainWindow.x, mainWindow.y)
            startWindowSize = Qt.size(mainWindow.width, mainWindow.height)
        }
        onPositionChanged: {
            var abs = absoluteMousePos(leftArea)
            var newWidth = Math.max(mainWindow.minimumWidth, startWindowSize.width - (abs.x - startMousePos.x))
            var newX = startWindowPos.x - (newWidth - startWindowSize.width)
            mainWindow.x = newX
            mainWindow.width = newWidth
        }
    }

    MouseArea {
        id: rightArea
        anchors{
            top: parent.top
            topMargin: mainWindow.titleHeight * 1.5
            bottom: parent.bottom
            bottomMargin: mainWindow.titleHeight * 0.15
            right: parent.rigth
        }
        width: mainWindow.titleHeight * 0.15
        x: parent.width - rightArea.width
        cursorShape: Qt.SizeHorCursor
        visible: (!mainWindow.isFullScreen)

        onPressed: {
            startMousePos = absoluteMousePos(rightArea)
            startWindowPos = Qt.point(mainWindow.x, mainWindow.y)
            startWindowSize = Qt.size(mainWindow.width, mainWindow.height)
        }
        onPositionChanged: {
            var abs = absoluteMousePos(rightArea)
            var newWidth = Math.max(mainWindow.minimumWidth, startWindowSize.width + (abs.x - startMousePos.x))
            mainWindow.width = newWidth
        }
    }

    MouseArea {
        id: buttonArea
        anchors{
            left: parent.left
            leftMargin: mainWindow.titleHeight * 0.15
            right: parent.right
            rightMargin: mainWindow.titleHeight * 0.15
        }
        y: parent.height - buttonArea.height // TODO: Переделать на anchors
        height: mainWindow.titleHeight * 0.15
        cursorShape: Qt.SizeVerCursor
        visible: (!mainWindow.isFullScreen)
        onPressed: {
            startMousePos = absoluteMousePos(buttonArea)
            startWindowPos = Qt.point(mainWindow.x, mainWindow.y)
            startWindowSize = Qt.size(mainWindow.width, mainWindow.height)
        }
        onPositionChanged: {
            var abs = absoluteMousePos(buttonArea)
            var newHeight = Math.max(mainWindow.minimumHeight, startWindowSize.height + (abs.y - startMousePos.y))
            mainWindow.height = newHeight
        }
    }

    MouseArea {
        id: leftCorArea
        anchors{
            left: parent.left
            bottom: parent.bottom
        }
        width: mainWindow.titleHeight * 0.15
        height: mainWindow.titleHeight * 0.15
        cursorShape: Qt.SizeBDiagCursor
        visible: (!mainWindow.isFullScreen)
        onPressed: {
            startMousePos = absoluteMousePos(leftCorArea)
            startWindowPos = Qt.point(mainWindow.x, mainWindow.y)
            startWindowSize = Qt.size(mainWindow.width, mainWindow.height)
        }
        onPositionChanged: {
            var abs = absoluteMousePos(leftCorArea)
            var newWidth = Math.max(mainWindow.minimumWidth, startWindowSize.width - (abs.x - startMousePos.x))
            var newHeight = Math.max(mainWindow.minimumHeight, startWindowSize.height + (abs.y - startMousePos.y))
            var newX = startWindowPos.x - (newWidth - startWindowSize.width)
            mainWindow.setGeometry(newX, mainWindow.y, newWidth, newHeight)
        }
    }

    MouseArea {
        id: rigthCorArea
        anchors{
            right: parent.right
            bottom: parent.bottom
        }
        width: mainWindow.titleHeight * 0.15
        height: mainWindow.titleHeight * 0.15
        cursorShape: Qt.SizeFDiagCursor
        visible: (!mainWindow.isFullScreen)
        onPressed: {
            startMousePos = absoluteMousePos(rigthCorArea)
            startWindowPos = Qt.point(mainWindow.x, mainWindow.y)
            startWindowSize = Qt.size(mainWindow.width, mainWindow.height)
        }
        onPositionChanged: {
            var abs = absoluteMousePos(rigthCorArea)
            var newWidth = Math.max(mainWindow.minimumWidth, startWindowSize.width + (abs.x - startMousePos.x))
            var newHeight = Math.max(mainWindow.minimumHeight, startWindowSize.height + (abs.y - startMousePos.y))
            mainWindow.setGeometry(mainWindow.x, mainWindow.y, newWidth, newHeight)
        }
    }
}
