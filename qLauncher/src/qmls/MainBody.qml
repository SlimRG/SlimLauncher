import QtQuick 2.0
import Qt5Compat.GraphicalEffects

import WRS 1.0

WindowRoundedSides{
    id: form
    anchors{
        fill: parent
        topMargin: 30 * 3 // 2 * HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics\CaptionHeight
    }

    width: parent.width
    color: "#ffffff"
    radius: 8
    side: "bottom"
    borderColor: "#80000000"
    borderWidth: 1

//    LinearGradient {
//        anchors.fill: parent
//        start: Qt.point(0, 0)
//        end: Qt.point(0, parent.height)
//        gradient: Gradient {
//            GradientStop { position: 0.2; color: Qt.rgba(255, 255, 255, 0.8) }
//            GradientStop { position: 0.66; color: Qt.rgba(255, 255, 255, 0) }
//            GradientStop { position: 0.75; color: Qt.rgba(255, 255, 255, 0.3) }
//            GradientStop { position: 1.0; color: "#FFFFFF" }
//        }
//    }
}
