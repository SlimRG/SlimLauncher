import QtQuick 2.0

Rectangle{
    anchors{
        left: leftSideTitle.right
        right: parent.right
        bottom: parent.bottom
    }
    color: "#ffffff"
    height: mainTitle.titleHeight * 1.5

    Image{
        id: minimizeBtn
        anchors{
            top: parent.top
            right: expandBtn.left
            rightMargin: mainTitle.titleHeight*2/3
        }
        height: mainTitle.titleHeight*2/3
        width: minimizeBtn.height

        source: "qrc:/UI/Images/Minimize.svg"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.info("Minimize image clicked!")
            }
        }
    }

    Image{
        id: expandBtn
        anchors{
            top: parent.top
            right: closeBtn.left
            rightMargin: mainTitle.titleHeight*2/3
        }
        height: mainTitle.titleHeight*2/3
        width: expandBtn.height
        source: "qrc:/UI/Images/Expand.svg"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.info("image clicked!")
            }
        }
    }

    Image{
        id: closeBtn
        anchors{
            top: parent.top
            right: parent.right
            rightMargin: mainTitle.titleHeight*2/3
        }
        height: mainTitle.titleHeight*2/3
        width: closeBtn.height
        source: "qrc:/UI/Images/Close.svg"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.info("image clicked!")
            }
        }
    }
}


