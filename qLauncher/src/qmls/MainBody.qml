import QtQuick 2.0
import Qt5Compat.GraphicalEffects

import Custom

WindowRoundedSides{
    id: form
    anchors{
        fill: parent
        topMargin: 30 * 3 // 2 * HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics\CaptionHeight
    }

    width: parent.width
    color: "#ffffff"
    radius: (mainWindow.visibility === Window.FullScreen) ? 0 : 8
    side: "bottom"
    borderColor: "#80000000"
    borderWidth: 1
}
