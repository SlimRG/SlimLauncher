import QtQuick 2.0
import NR 1.0

Item{
    anchors{
        top: parent.top
        bottom: parent.bottom
    }
    width: mainWindow.width/2

    NotchedRectangle {
        id: subtract
        anchors{
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
        height: mainTitle.titleHeight * 1.5
        notchCenter: Qt.point(logo.width * 2, -subtract.notchRadius + subtract.height)
        notchRadius: logo.width * 0.8
        color: "#ffffff"
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
