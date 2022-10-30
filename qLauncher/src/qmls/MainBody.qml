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
}
