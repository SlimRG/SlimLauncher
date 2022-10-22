import QtQuick
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
import NR 1.0

Window {
    id: mainWindow
    width: 640
    height: 720
    visible: true
    title: qsTr("Hello World")
    flags: Qt.Window | Qt.FramelessWindowHint
    color: "transparent"

    property point startMousePos
    property point startWindowPos
    property size startWindowSize

    function absoluteMousePos(mouseArea) {
        var windowAbs = mouseArea.mapToItem(null, mouseArea.mouseX, mouseArea.mouseY)
        return Qt.point(windowAbs.x + mainWindow.x,
                        windowAbs.y + mainWindow.y)
    }

    function cDrawBgProgressBar(parentObj) {
      const cnv = parentObj;
      const ctx = cnv.getContext(`2d`);

      const numberOfRings     = 3;
      const ringRadiusOffset  = 3;
      const ringRadius        = 200;
      const waveOffset        = 15;
      const colors            = [`#0472ff`, `#04a5ff`, `#00bfff`];
      let startAngle          = 0;

      function updateRings() {
        for (let i = 0; i < numberOfRings; i++) {
          let radius = i * ringRadiusOffset + ringRadius;
          let offsetAngle = i * waveOffset * Math.PI / 180;
          drawRing(radius, colors[i], offsetAngle);
        }

        startAngle >= 360? startAngle = 0 : startAngle++;
      }

      let centerX = cnv.width  / 2;
      let centerY = cnv.height / 2;

      const maxWavesAmplitude = 17;
      const numberOfWaves     = 7;

      function drawRing(radius, color, offsetAngle) {
        ctx.strokeStyle = color;
        ctx.lineWidth   = 9;

        ctx.beginPath();

        for (let j = -180; j < 180; j++) {
          let currentAngle  = (j + startAngle) * Math.PI / 180;
          let displacement  = 0;
          let now = Math.abs(j);

          if (now > 70) {
            displacement = (now - 70) / 70;
          }

          if (displacement >= 1) {
            displacement = 1;
          }

          let waveAmplitude = radius + displacement * Math.sin((currentAngle + offsetAngle) * numberOfWaves) * maxWavesAmplitude;
          let x = centerX + Math.cos(currentAngle) * waveAmplitude;
          let y = centerY + Math.sin(currentAngle) * waveAmplitude;
          j > -180? ctx.lineTo(x, y) : ctx.moveTo(x, y);

        }
        ctx.closePath();
        ctx.stroke();
      }

      function loop() {
        ctx.clearRect(0, 0, cnv.width, cnv.height);
        updateRings();
        loading.requestAnimationFrame(loop);
      }
      loop();
    }

    Row{
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

        Rectangle{
            id: title_icons
            x: user_logo.width
            y: 48
            width: parent.width-user_logo.width
            height: 58
            color: "#ffffff"
            antialiasing: true

            Image{
                id: minimizeBtn
                x: 181
                y: 22
                width: 52
                height: 36
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
                x: 241
                y: 22
                width: 52
                height: 36
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
                x: 301
                y: 22
                width: 52
                height: 36
                source: "qrc:/UI/Images/Close.svg"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.info("image clicked!")
                    }
                }
            }
        }
    }

    Rectangle{
        id: form
        y: title.height
        width: parent.width
        height: parent.height - title.height
        color: "#ffffff"

        LinearGradient {
            anchors.fill: parent
            start: Qt.point(0, 0)
            end: Qt.point(0, parent.height)
            gradient: Gradient {
                GradientStop { position: 0.2; color: Qt.rgba(255, 255, 255, 0.8) }
                GradientStop { position: 0.66; color: Qt.rgba(255, 255, 255, 0) }
                GradientStop { position: 0.75; color: Qt.rgba(255, 255, 255, 0.3) }
                GradientStop { position: 1.0; color: "#FFFFFF" }
            }
        }

        Canvas{
            id: loading
            x: 0
            y: 64
            width: 512
            height: 486

            onPaint: {
                cDrawBgProgressBar(loading);
            }
        }

    }

    MouseArea {
        id: moveArea
        anchors.fill: title
        property point mPos;
        onPressed: {
            mPos = Qt.point(mouseX, mouseY)
        }
        onPositionChanged: {
            mainWindow.setX(mainWindow.x + mouseX - mPos.x)
            mainWindow.setY(mainWindow.y + mouseY - mPos.y)
        }
    }

    MouseArea {
        id: leftArea
        anchors.top: parent.top
        anchors.topMargin: 48
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        cursorShape: Qt.SizeHorCursor
        width: 5
        onPressed: {
            startMousePos = absoluteMousePos(leftArea)
            startWindowPos = Qt.point(mainWindow.x, mainWindow.y)
            startWindowSize = Qt.size(mainWindow.width, mainWindow.height)
        }
        onPositionChanged: {
            var abs = absoluteMousePos(leftArea)
            var newWidth = Math.max(mainWindow.minimumWidth, startWindowSize.width - (abs.x - startMousePos.x))
            var newX = startWindowPos.x - (newWidth - startWindowSize.width)
            mainWindow.x = newX
            mainWindow.width = newWidth
        }
    }

    MouseArea {
        id: rightArea
        width: 5
        x: parent.width - rightArea.width
        anchors.right: parent.rigth
        anchors.top: parent.top
        anchors.rightMargin: 5
        anchors.topMargin: 48
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        cursorShape: Qt.SizeHorCursor

        onPressed: {
            startMousePos = absoluteMousePos(rightArea)
            startWindowPos = Qt.point(mainWindow.x, mainWindow.y)
            startWindowSize = Qt.size(mainWindow.width, mainWindow.height)
        }
        onPositionChanged: {
            var abs = absoluteMousePos(rightArea)
            var newWidth = Math.max(mainWindow.minimumWidth, startWindowSize.width + (abs.x - startMousePos.x))
            mainWindow.width = newWidth
        }
    }

    MouseArea {
        id: leftCorArea
        width: 5
        height: 5
        anchors.left: parent.left
        y: parent.height - leftCorArea.height
        cursorShape: Qt.SizeBDiagCursor

        onPressed: {
            startMousePos = absoluteMousePos(leftCorArea)
            startWindowPos = Qt.point(mainWindow.x, mainWindow.y)
            startWindowSize = Qt.size(mainWindow.width, mainWindow.height)
        }

        onPositionChanged: {
            var abs = absoluteMousePos(leftCorArea)
            var newWidth = Math.max(mainWindow.minimumWidth, startWindowSize.width - (abs.x - startMousePos.x))
            var newHeight = Math.max(mainWindow.minimumHeight, startWindowSize.height + (abs.y - startMousePos.y))
            var newX = startWindowPos.x - (newWidth - startWindowSize.width)
            mainWindow.setGeometry(newX, mainWindow.y, newWidth, newHeight)
        }
    }

    MouseArea {
        id: rigthCorArea
        width: 5
        height: 5
        y: parent.height - rigthCorArea.height
        x: parent.width - rigthCorArea.width
        cursorShape: Qt.SizeFDiagCursor

        onPressed: {
            startMousePos = absoluteMousePos(rigthCorArea)
            startWindowPos = Qt.point(mainWindow.x, mainWindow.y)
            startWindowSize = Qt.size(mainWindow.width, mainWindow.height)
        }

        onPositionChanged: {
            var abs = absoluteMousePos(rigthCorArea)
            var newWidth = Math.max(mainWindow.minimumWidth, startWindowSize.width + (abs.x - startMousePos.x))
            var newHeight = Math.max(mainWindow.minimumHeight, startWindowSize.height + (abs.y - startMousePos.y))
            mainWindow.setGeometry(mainWindow.x, mainWindow.y, newWidth, newHeight)
        }
    }

    MouseArea {
        id: buttonArea
        y: parent.height - buttonArea.height
        height: 5
        anchors.leftMargin: 5
        anchors.left: parent.left
        anchors.rightMargin: 5
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        cursorShape: Qt.SizeVerCursor

        onPressed: {
            startMousePos = absoluteMousePos(buttonArea)
            startWindowPos = Qt.point(mainWindow.x, mainWindow.y)
            startWindowSize = Qt.size(mainWindow.width, mainWindow.height)
        }
        onPositionChanged: {
            var abs = absoluteMousePos(buttonArea)
            var newHeight = Math.max(mainWindow.minimumHeight, startWindowSize.height + (abs.y - startMousePos.y))
            mainWindow.height = newHeight
        }
    }

}

