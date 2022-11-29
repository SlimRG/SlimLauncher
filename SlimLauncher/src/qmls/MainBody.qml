import QtQuick
import Qt5Compat.GraphicalEffects
import Custom

WindowRoundedSides{
    // Main properties
    id: form
    width: parent.width
    color: "#ffffff"
    radius: (!mainWindow.isFullScreen) ? mainWindow.cornerRadiusTopLevel : 0
    side: "bottom"
    borderColor: mainWindow.colorBorderWindow
    borderWidth: mainWindow.borderWidthWindow

    // Anchors properties
    anchors{
        fill: parent
        topMargin: mainWindow.titleHeight * 3 -1
    }


}
