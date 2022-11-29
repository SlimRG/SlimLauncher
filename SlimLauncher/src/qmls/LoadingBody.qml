import QtQuick 2.0

Item {
    id: loading_body
    anchors{
        fill: parent
    }

    Canvas{
        id: loading

        property int animationFrame: -1
        property real startAngle: 0

        anchors{
            fill: parent
            leftMargin: 10
            rightMargin: 10
            bottomMargin: 10
            topMargin: 10
        }

        onWidthChanged: {
            if (loading.animationFrame == (-1))
                return;
            loading.cancelRequestAnimationFrame(loading.animationFrame);
            js_DrawBgProgressBar(loading);
        }

        onHeightChanged: {
            if (loading.animationFrame == (-1))
                return;
            loading.cancelRequestAnimationFrame(loading.animationFrame);
            js_DrawBgProgressBar(loading);
        }

        onPaint: {
            js_DrawBgProgressBar();
        }
    }

    function js_DrawBgProgressBar() {
        const numberOfRings     = 5;
        const ringRadiusOffset  = 3;
        const ringRadius        = 200;
        const waveOffset        = 15;
        const maxWavesAmplitude = 17;
        const numberOfWaves     = 7;
        const colors            = [`#0B3C4D`, `#0E5066`, `#136480`, `#127899`, `#1A8BB3`];

        const ctx = loading.getContext(`2d`);

        function updateRings() {
            for (let i = 0; i < numberOfRings; i++) {
                let radius = i * ringRadiusOffset + ringRadius;
                let offsetAngle = i * waveOffset * Math.PI / 180;
                drawRing(radius, colors[i], offsetAngle);
            }

            if (loading.startAngle++ >= 360)
                loading.startAngle = 0;
        }

        function drawRing(radius, color, offsetAngle) {
            ctx.strokeStyle = color;
            ctx.lineWidth   = 9;

            ctx.beginPath();

            for (let j = -180; j < 180; j++) {
                let currentAngle  = (j + loading.startAngle) * Math.PI / 180;
                let displacement  = 0;
                let now = Math.abs(j);

                if (now > 70) {
                    displacement = (now - 70) / 70;
                }

                if (displacement >= 1) {
                    displacement = 1;
                }

                let waveAmplitude = radius + displacement * Math.sin((currentAngle + offsetAngle) * numberOfWaves) * maxWavesAmplitude;
                let x = (loading.width  / 2) + Math.cos(currentAngle) * waveAmplitude;
                let y = (loading.height / 2) + Math.sin(currentAngle) * waveAmplitude;

                if (j > -180)
                    ctx.lineTo(x, y);
                else
                    ctx.moveTo(x, y);

            }
            ctx.closePath();
            ctx.stroke();
        }

        function loop() {
            ctx.clearRect(0, 0, loading.width, loading.height);
            updateRings();
            loading.animationFrame = loading.requestAnimationFrame(loop);
        }
        loop();

    }
}
