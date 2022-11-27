import QtQuick
import Qt5Compat.GraphicalEffects
import Custom

Item{
    // Main properties
    id: ls_main_title
    width: parent.width/2

    // Anchors properties
    anchors{
        top: parent.top
        bottom: parent.bottom
        left: parent.left
    }

    // Body [leftRoundedCorner]
    WindowRoundedSides{
        // Main properties
        id: leftRoundedCorner
        radius: (mainWindow.isFullScreen) ? 0 : mainWindow.cornerRadiusTopLevel
        height: (mainWindow.isFullScreen) ? parent.height : mainWindow.titleHeight * 1.5
        width: leftRoundedCorner.radius * 2
        side: "top,left"
        color: mainWindow.colorActiveWindow
        borderColor: mainWindow.colorBorderWindow
        borderWidth: mainWindow.borderWidthWindow

        // Anchors properties
        anchors{
            bottom: parent.bottom
            left: parent.left
        }
    }

    // Body [subtract]
    NotchedRectangle {
        // Main properties
        id: subtract
        height: (mainWindow.isFullScreen) ? parent.height : mainWindow.titleHeight * 1.5
        notchCenter: Qt.point(logo.width * 2, -subtract.notchRadius + subtract.height-mainWindow.borderWidthWindow)
        notchRadius: (mainWindow.isFullScreen) ? 0 : logo.width * 0.8
        color: mainWindow.colorActiveWindow
        borderColor: mainWindow.colorBorderWindow
        borderWidth: mainWindow.borderWidthWindow
        onlyTopBorder: true

        // Anchors properties
        anchors{
            bottom: parent.bottom
            left: leftRoundedCorner.right
            right: parent.right
        }   
    }

    // Body [logo]
    Image {
        // Main properties
        id: logo
        width: logo.height
        height: mainWindow.titleHeight * 2.5
        source: "qrc:/UI/Images/Logo.svg"
        sourceSize.width: logo.width
        sourceSize.height: logo.height

        // Anchors properties
        anchors{
            bottom: subtract.bottom
            bottomMargin: logo.width*0.156
            left: subtract.left
            leftMargin: logo.width * 1.5
        }      
    }
}
