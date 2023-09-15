import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Item {
    id: battery_temp_gauge_item
    property real value: 0 // this is where the mdl.batteryTemp variable is passed in

    Gauge {
        id: battery_temp_gauge
        width: 115
        height: 300
        maximumValue: 75
        minimumValue: 15
        tickmarkStepSize: 10
        value: parent.value

        style: GaugeStyle {
            valueBar: Rectangle {
                implicitWidth: 80
                color: {
                   if (battery_temp_gauge.value < 65) {return "#4bbfdf"}
                   else if (battery_temp_gauge.value < 70) {return "yellow"}
                   else {return "red"}
                }
            }
        }
    }

    Text {
        id: battery_temp_text
        anchors {
            top: battery_temp_gauge.bottom
            topMargin: 10
            horizontalCenter: battery_temp_gauge.horizontalCenter
        }
        color: "white"
        text: "Battery Temp\n" + battery_temp_gauge.value
        font.pixelSize: 20
    }
}

