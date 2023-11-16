import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import "ui"

Item {
    id: root
    property int size: 300
    property real value: 0
    property color primaryColor: "#ff6725"
    property color secondaryColor: "#52adff"
    property color thirdColor: "black"
    property string button_text: "AAA" // these are defaults
    // custom state for seeing if timer was full
    property int full: 0
    width: size
    height: size

    onValueChanged: c.degree = value * 360

    Canvas {
        id: c
        property real degree: 0

        anchors.fill: parent
        antialiasing: true
        onDegreeChanged: requestPaint()

        onPaint: {
            var ctx = getContext("2d");

            var x = root.width / 2;
            var y = root.height / 2;

            var radius = root.size / 2
            var startAngle = (Math.PI / 180) * 270;
            var fullAngle = (Math.PI / 180) * (270 + 360);
            var progressAngle = (Math.PI / 180) * (270 + degree);

            ctx.reset()

            ctx.fillStyle = root.secondaryColor;
            ctx.beginPath();
            ctx.moveTo(x,y);
            ctx.arc(x, y, radius-1, startAngle, fullAngle);
            ctx.lineTo(x, y)
            ctx.fill();

            ctx.fillStyle = root.primaryColor;
            ctx.beginPath();
            ctx.moveTo(x,y);
            ctx.arc(x, y, radius, startAngle, progressAngle);
            ctx.lineTo(x, y)
            ctx.fill();

            // draw transparent circle
            ctx.fillStyle = root.thirdColor;
            ctx.beginPath();
            ctx.arc(x, y, radius * 0.9, 0, 2 * Math.PI);
            ctx.fill();
            // end new
        }
    }

    // text in the middle
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: button_text
        color: primaryColor
        font.pixelSize: 38
        font.bold: true
    }

    // outline of button in primary color
    Rectangle {
        width: size - 25
        height: size - 25
        radius: size - 25
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
        color: parent.primaryColor
        z: -1
    }
}
