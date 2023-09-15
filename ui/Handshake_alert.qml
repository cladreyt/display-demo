import QtQuick 2.0

Rectangle {
    id: handshake_alert
    width: 500
    height: 180
    z: 3
    color: "Red"
    visible: false

    Text {
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        font.bold: true
        font.pixelSize: 70
        font.family: "Digital-7"
        text: "PRECHARGE FAILED"
    }
}
