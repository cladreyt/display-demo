import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Item {
    id: mph_item
    property real value: 0
    property string color: "#4bbfdf"

    Rectangle {
        id: circle_dashboard
        z: 1
        width: 210
        height: width
        radius: width * 0.5
        border.width: 1
        color: parent.color
    }

    Text {
        id: mph
        text: Math.round(parent.value) //mdl.speed
        textFormat: Text.AutoText //should this be deleted??
        color: "black"
        anchors {
            left: circle_dashboard.left
            leftMargin: 15
            top: circle_dashboard.top
            topMargin: 55
        }
        z: 2
        width: 150
        height: 100
        horizontalAlignment: Text.AlignRight
        font.family: "Digital-7 Mono"
        font.pixelSize: 100
    }

    Text{
        id: mph_text
        text: "mph"
        color: "black"
        anchors {
            horizontalCenter: circle_dashboard.horizontalCenter
            top: circle_dashboard.top
            topMargin: 147
        }
        z: 2
        font.family: "Digital-7 Mono"
        font.pixelSize: 30
    }
}

