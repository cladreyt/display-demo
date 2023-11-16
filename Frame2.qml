import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import "ui"

Item {
    width: 1024
    height:600

    Rectangle {
        width: parent.width
        height: parent.height
        color: "black"
    }

    Rectangle { // button to switch between screens
        width: 300
        height: 75
        anchors.horizontalCenter: parent.horizontalCenter
        y: 470
        color: "black"
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "CONTINUE"
            font.bold: true
            font.pixelSize: 38
            color: "gray"
            opacity: 0.5
        }
        Rectangle {
            width: 310
            height: 85
            z:-1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: "gray"
            opacity: 0.5
        }
        MouseArea {
            id: continue_button
            anchors.fill: parent
            onPressed: rootlist.currentIndex = 1
        }
    }

    Circle_gauge {
        id: launch_circle
        anchors.verticalCenterOffset: -50
        anchors.horizontalCenterOffset: -220
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        primaryColor: "#4bbfdf"
        secondaryColor: "transparent"
        thirdColor: "black"

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "LAUNCH"
            color: "#4bbfdf"
            font.pixelSize: 38
            font.bold: true
        }

        Rectangle {
            width: 275
            height: 275
            radius: 275
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: parent.primaryColor
            z: -1
        }
    }

    Circle_gauge {
        id: discharge_circle
        z: 2
        anchors.verticalCenterOffset: -50
        anchors.horizontalCenterOffset: 220
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        primaryColor: "red"
        secondaryColor: "transparent"
        thirdColor: "black"

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "DISCHARGE"
            color: "red"
            font.pixelSize: 38
            font.bold: true
        }
        Rectangle {
            width: 275
            height: 275
            radius: 275
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: parent.primaryColor
            z: -1
        }
    }
}
