import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Item {
    id: coolant_gauge_item
    property real value: 0 // this is where the mdl.MotorTemp variable is passed in

    Gauge {
        id: coolant_gauge
        width: 115
        height: 420
        maximumValue: 60
        minimumValue: 0
        tickmarkStepSize: 10
        value: parent.value

        style: GaugeStyle {
            valueBar: Rectangle {
                implicitWidth: 80
                    color: {
                        if (coolant_gauge.value <= 45) { return "#4bbfdf" }
                        else if (coolant_gauge.value <= 50) { return "yellow" }
                        else { return "red" }
                    }
                }
            }
        }

    Text {
        id: coolant_text
        anchors {
            top: coolant_gauge.bottom
            topMargin: 10
            horizontalCenter: coolant_gauge.horizontalCenter
        }
        color: "white"
        text: "Coolant Temp\n" + coolant_gauge.value
        font.pixelSize: 20
    }
}
