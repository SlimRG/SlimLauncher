import QtQuick
import QtQuick.Controls 2.5
import Qt5Compat.GraphicalEffects
import NR 1.0

Window {
    width: 640
    height: 720
    visible: true
    title: qsTr("Hello World")
    //flags: Qt.FramelessWindowHint
    color: "transparent"

    Item{
        id: title
        width: parent.width

        Item{
            id: user_logo
            width: 263
            height: 106

            NotchedRectangle {
                id: subtract
                x: 0
                y: 48
                width: 263
                height: 58
                notchCenter: Qt.point(143, -4)
                notchRadius: 53
                color: "#ffffff"
                antialiasing: true
            }

            FastBlur {
                anchors.fill: subtract
                source: subtract
                radius: 100
            }

            Item {
                id: logo
                x: 99.5
                y: 0
                width: 88
                height: 88

                Image {
                    source: "qrc:/UI/Images/Logo.svg"
                    sourceSize.width: logo.width
                    sourceSize.height: logo.height
                }

            }
        }
    }
}

