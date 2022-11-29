import QtQuick 2.15
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
        LoginBody{
            id: login_body
            visible: false
        }
        LoadingBody{
            id: loading_body
            visible: true
        }
    }
}
