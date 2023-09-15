import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Item {
    id: mc_gauge_item
    property real value: 0 // this is where the mdl.MCTemp variable is passed in

    Gauge {
        id: mc_gauge
        value: parent.value
        width: 115
        height: 420
        maximumValue: 70
        minimumValue: 0
        tickmarkStepSize: 10

        style: GaugeStyle {
            valueBar: Rectangle {
                implicitWidth: 80
                color: {
                    if (mc_gauge.value <= 55) { return "#4bbfdf" } // blue color
                    else if (mc_gauge.value <= 60) { return "yellow" }
                    else { return "red" }
                }
            }
        }
    }

    Text {
        id:mc_gauge_text
        anchors {
            top: mc_gauge.bottom
            topMargin: 10
            horizontalCenter: mc_gauge.horizontalCenter
        }
        color: "white"
        text: "Controller Temp\n" + mc_gauge.value
        font.pixelSize: 20
    }

}
