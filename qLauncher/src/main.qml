import QtQuick
import QtQuick.Controls 2.15

import "qmls/"

MainWindow{
    id: mainWindow
    MainTitle{
        id:mainTitle
        LSMainTitle{
            id: leftSideTitle
        }
        RSMainTitle{
            id: rightSideTitle
        }
    }
    MainBody{
        id: mainBody
    }
}
