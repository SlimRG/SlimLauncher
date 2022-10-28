import QtQuick
import QtQuick 2.0


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
        anchors.fill: mainTitle
        property point mPos;
        onPressed: {
            mPos = Qt.point(mouseX, mouseY)
        }
        onPositionChanged: {
            mainWindow.setX(mainWindow.x + mouseX - mPos.x)
            mainWindow.setY(mainWindow.y + mouseY - mPos.y)
        }
    }
}
