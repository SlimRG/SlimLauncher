import Qt5Compat.GraphicalEffects

import QtQuick 2.0
import WRS 1.0

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
        height: mainTitle.titleHeight * 1.5        
        radius: 8
        side: "top,right"
        color: "#ffffff"
        borderColor: "#99000000"
        borderWidth: 1

        Image{
            id: minimizeBtn
            anchors{
                top: parent.top
                topMargin: mainTitle.titleHeight/5
                right: expandBtn.left
                rightMargin: mainTitle.titleHeight*0.9
            }
            height: mainTitle.titleHeight*2/3
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
                    console.info("Minimize image clicked!")
                }
            }
        }

        Image{
            id: expandBtn
            anchors{
                top: parent.top
                topMargin: mainTitle.titleHeight/5
                right: closeBtn.left
                rightMargin: mainTitle.titleHeight*0.9
            }
            height: mainTitle.titleHeight*2/3
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
                    console.info("image clicked!")
                }
            }
        }

        Image{
            id: closeBtn
            anchors{
                top: parent.top
                topMargin: mainTitle.titleHeight/5
                right: parent.right
                rightMargin: mainTitle.titleHeight*0.45
            }
            height: mainTitle.titleHeight*2/3
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
                    console.info("image clicked!")
                }
            }
        }
    }
}


