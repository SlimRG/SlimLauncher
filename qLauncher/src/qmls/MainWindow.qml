import QtQuick
import QtQuick 2.15

Window {
    id: mainWindow
    width: 640
    height: 720
    visible: true
    title: qsTr("Hello World")
    flags: Qt.Window | Qt.FramelessWindowHint
    color: "transparent"

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
        anchors.top: parent.top
        anchors.topMargin: 30 * 1.5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        cursorShape: Qt.SizeHorCursor
        width: 5
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
        width: 5
        x: parent.width - rightArea.width
        anchors.right: parent.rigth
        anchors.top: parent.top
        anchors.rightMargin: 5
        anchors.topMargin: 48
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        cursorShape: Qt.SizeHorCursor

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
        id: leftCorArea
        width: 5
        height: 5
        anchors.left: parent.left
        y: parent.height - leftCorArea.height
        cursorShape: Qt.SizeBDiagCursor

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
        width: 5
        height: 5
        y: parent.height - rigthCorArea.height
        x: parent.width - rigthCorArea.width
        cursorShape: Qt.SizeFDiagCursor

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

    MouseArea {
        id: buttonArea
        y: parent.height - buttonArea.height
        height: 5
        anchors.leftMargin: 5
        anchors.left: parent.left
        anchors.rightMargin: 5
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        cursorShape: Qt.SizeVerCursor

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
}
