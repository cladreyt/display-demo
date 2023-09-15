import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Item {
    id: sum_voltage_gauge_item
    property real value: 70

    Gauge {
        id: sum_voltage_gauge
        width: 115
        height: 300
        maximumValue: 120
        minimumValue: 70
        tickmarkStepSize: 10
        value: parent.value
        style: GaugeStyle {
            valueBar: Rectangle {
                implicitWidth: 80
                color: {
                    if (sum_voltage_gauge.value < 80) {return "red" }
                    else if (sum_voltage_gauge.value <= 89) { return "yellow" }
                    else { return "#4bbfdf" }
                }
            }
        }
    }

    Text {
        id: sum_voltage_text
        anchors {
            top: sum_voltage_gauge.bottom
            topMargin: 10
            horizontalCenter: sum_voltage_gauge.horizontalCenter
        }
        color: "white"
        text: "Sum Battery Voltage\n" + (sum_voltage_gauge.value).toFixed(2)
        font.pixelSize: 20
    }
}
