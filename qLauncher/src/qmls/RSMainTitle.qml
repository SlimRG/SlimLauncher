import QtQuick
import Qt5Compat.GraphicalEffects
import Custom

Item{
    // Main properties
    id: rs_main_title
    width: mainWindow.width/2

    // Anchors properties
    anchors{
        top: parent.top
        bottom: parent.bottom
        right: parent.right
    }

    // Body [title_icons]
    WindowRoundedSides{
        // Main properties
        id: title_icons
        height: (mainWindow.isFullScreen) ? parent.height : mainWindow.titleHeight * 1.5
        radius: (mainWindow.isFullScreen) ? 0 : mainWindow.cornerRadiusTopLevel
        side: "top,right"
        color: mainWindow.colorActiveWindow
        borderColor: mainWindow.colorBorderWindow
        borderWidth: mainWindow.borderWidthWindow

        // Anchors properties
        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        // Body [minimizeBtn]
        Image{
            // Main properties
            id: minimizeBtn
            height: mainWindow.titleHeight * 0.85
            width: minimizeBtn.height
            source: "qrc:/UI/Images/Minimize.svg"

            // Anchors properties
            anchors{
                top: parent.top
                topMargin: mainWindow.titleHeight/5
                right: expandBtn.left
                rightMargin: mainWindow.titleHeight * 1.15
            }

            // Effects properties
            ColorOverlay {
                anchors.fill: minimizeBtn
                source: minimizeBtn
                color: (minimizeBtn_ma.pressed) ? mainWindow.colorColorization : (minimizeBtn_ma.containsMouse) ? mainWindow.colorHoverCol : "transparent"
            }

            // Mouse effects
            MouseArea {
                id: minimizeBtn_ma
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    mainWindow.showMinimized();
                }
            }
        }

        // Body [expandBtn]
        Image{
            // Main properties
            id: expandBtn
            height: mainWindow.titleHeight * 0.85
            width: expandBtn.height
            source: "qrc:/UI/Images/Expand.svg"

            // Anchors properties
            anchors{
                top: parent.top
                topMargin: mainWindow.titleHeight/5
                right: closeBtn.left
                rightMargin: mainWindow.titleHeight * 1.15
            }

            // Effects properties
            ColorOverlay {
                anchors.fill: expandBtn
                source: expandBtn
                color: (expandBtn_ma.pressed) ? mainWindow.colorColorization : (expandBtn_ma.containsMouse) ? mainWindow.colorHoverCol : "transparent"
            }

            // Mouse effects
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

        // Body [unexpandBtn]
        Image{
            // Main properties
            id: unexpandBtn
            height: mainWindow.titleHeight * 0.85
            width: unexpandBtn.height
            source: "qrc:/UI/Images/Unexpand.svg"
            visible: false

            // Anchors properties
            anchors{
                top: parent.top
                topMargin: mainWindow.titleHeight/5
                right: closeBtn.left
                rightMargin: mainWindow.titleHeight * 1.15
            }

            // Effects properties
            ColorOverlay {
                anchors.fill: unexpandBtn
                source: unexpandBtn
                color: (unexpandBtn_ma.pressed) ? mainWindow.colorColorization : (unexpandBtn_ma.containsMouse) ? mainWindow.colorHoverCol : "transparent"
            }

            // Mouse effects
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
            // Main properties
            id: closeBtn
            height: mainWindow.titleHeight * 0.85
            width: closeBtn.height
            source: "qrc:/UI/Images/Close.svg"

            // Anchors properties
            anchors{
                top: parent.top
                topMargin: mainWindow.titleHeight/5
                right: parent.right
                rightMargin: mainWindow.titleHeight * 0.6
            }

            // Effects properties
            ColorOverlay {
                anchors.fill: closeBtn
                source: closeBtn
                color: (closeBtn_ma.pressed) ? mainWindow.colorColorization : (closeBtn_ma.containsMouse) ? mainWindow.colorHoverCol : "transparent"
            }

            // Mouse effects
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


