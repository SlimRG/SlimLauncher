import QtQuick 2.0
import Qt5Compat.GraphicalEffects

import Custom

WindowRoundedSides{
    id: form
    anchors{
        fill: parent
        topMargin: mainWindow.titleHeight * 3 -1
    }

    width: parent.width
    color: "#ffffff"
    radius: (!mainWindow.isFullScreen) ? mainWindow.cornerRadiusTopLevel : 0
    side: "bottom"
    borderColor: mainWindow.colorBorderWindow
    borderWidth: mainWindow.borderWidthWindow
}
