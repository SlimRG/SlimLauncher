import QtQuick 2.0
import Qt5Compat.GraphicalEffects

import Custom

Item{
    id: ls_main_title
    anchors{
        top: parent.top
        bottom: parent.bottom
        left: parent.left
    }
    width: mainWindow.width/2

    WindowRoundedSides{
        id: leftRoundedCorner
        anchors{
            bottom: parent.bottom
            left: parent.left
        }
        width: leftRoundedCorner.radius * 2
        height: (mainWindow.visibility == Window.FullScreen) ? parent.height : mainTitle.titleHeight * 1.5
        radius: (mainWindow.visibility == Window.FullScreen) ? 0 : 8
        side: "top,left"
        color: "#ffffff"
        borderColor: "grey"
        borderWidth: 1
    }

    NotchedRectangle {
        id: subtract
        anchors{
            bottom: parent.bottom
            left: leftRoundedCorner.right
            right: parent.right
        }

        height: (mainWindow.visibility == Window.FullScreen) ? parent.height : mainTitle.titleHeight * 1.5

        notchCenter: Qt.point(logo.width * 2, -subtract.notchRadius + subtract.height-1)
        notchRadius: (mainWindow.visibility == Window.FullScreen) ? 0 : logo.width * 0.8
        color: "#ffffff"
        borderColor: "#80000000"
        borderWidth: 1
        onlyTopBorder: true
    }

    Image {
        id: logo
        anchors{
            bottom: subtract.bottom
            bottomMargin: logo.width*0.156
            left: subtract.left
            leftMargin: logo.width * 1.5
        }
        width: logo.height
        height: mainTitle.titleHeight * 2.5

        source: "qrc:/UI/Images/Logo.svg"
        sourceSize.width: logo.width
        sourceSize.height: logo.height
    }
}
