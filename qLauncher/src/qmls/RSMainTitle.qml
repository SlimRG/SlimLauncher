import QtQuick 2.0
import Qt5Compat.GraphicalEffects

import Custom

Item{
    anchors{
        top: parent.top
        bottom: parent.bottom
        right: parent.right
    }
    width: mainWindow.width/2

    WindowRoundedSides{
        id: title_icons
        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        height: (mainWindow.isFullScreen) ? parent.height : mainWindow.titleHeight * 1.5
        radius: (mainWindow.isFullScreen) ? 0 : mainWindow.cornerRadiusTopLevel
        side: "top,right"
        color: mainWindow.colorActiveWindow
        borderColor: mainWindow.colorBorderWindow
        borderWidth: mainWindow.borderWidthWindow

        Image{
            id: minimizeBtn
            anchors{
                top: parent.top
                topMargin: mainWindow.titleHeight/5
                right: expandBtn.left
                rightMargin: mainWindow.titleHeight * 1.15
            }
            height: mainWindow.titleHeight * 0.85
            width: minimizeBtn.height

            source: "qrc:/UI/Images/Minimize.svg"

            ColorOverlay {
                anchors.fill: minimizeBtn
                source: (minimizeBtn_ma.pressed || minimizeBtn_ma.containsMouse) ? minimizeBtn : null
                color: (minimizeBtn_ma.pressed) ? "#41A5EE" : (minimizeBtn_ma.containsMouse) ? "#0077FF" : "transparent"
            }

            MouseArea {
                id: minimizeBtn_ma
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    mainWindow.showMinimized();
                }
            }
        }

        Image{
            id: expandBtn
            anchors{
                top: parent.top
                topMargin: mainWindow.titleHeight/5
                right: closeBtn.left
                rightMargin: mainWindow.titleHeight * 1.15
            }
            height: mainWindow.titleHeight * 0.85
            width: expandBtn.height
            source: "qrc:/UI/Images/Expand.svg"

            ColorOverlay {
                anchors.fill: expandBtn
                source: (expandBtn_ma.pressed || expandBtn_ma.containsMouse) ? expandBtn : null
                color: (expandBtn_ma.pressed) ? "#41A5EE" : (expandBtn_ma.containsMouse) ? "#0077FF" : "transparent"
            }

            MouseArea {
                id: expandBtn_ma
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    mainWindow.showFullScreen();
                    expandBtn.visible = false;
                    unexpandBtn.visible = true;
                }
            }
        }

        Image{
            id: unexpandBtn
            anchors{
                top: parent.top
                topMargin: mainWindow.titleHeight/5
                right: closeBtn.left
                rightMargin: mainWindow.titleHeight * 1.15
            }
            height: mainWindow.titleHeight * 0.85
            width: unexpandBtn.height
            source: "qrc:/UI/Images/Unexpand.svg"

            visible: false

            ColorOverlay {
                anchors.fill: unexpandBtn
                source: (unexpandBtn_ma.pressed || unexpandBtn_ma.containsMouse) ? unexpandBtn : null
                color: (unexpandBtn_ma.pressed) ? "#41A5EE" : (unexpandBtn_ma.containsMouse) ? "#0077FF" : "transparent"
            }

            MouseArea {
                id: unexpandBtn_ma
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    mainWindow.showNormal();
                    unexpandBtn.visible = false;
                    expandBtn.visible = true;
                }
            }
        }

        Image{
            id: closeBtn
            anchors{
                top: parent.top
                topMargin: mainWindow.titleHeight/5
                right: parent.right
                rightMargin: mainWindow.titleHeight * 0.6
            }
            height: mainWindow.titleHeight * 0.85
            width: closeBtn.height
            source: "qrc:/UI/Images/Close.svg"

            ColorOverlay {
                anchors.fill: closeBtn
                source: (closeBtn_ma.pressed || closeBtn_ma.containsMouse) ? closeBtn : null
                color: (closeBtn_ma.pressed) ? "#41A5EE" : (closeBtn_ma.containsMouse) ? "#0077FF" : "transparent"
            }

            MouseArea {
                id: closeBtn_ma
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    Qt.callLater(Qt.quit);
                }
            }
        }
    }
}


