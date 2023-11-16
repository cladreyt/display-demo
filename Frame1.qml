import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import "ui"

Item {
    width: 1024
    height: 600

    // ******** ROTATING THE DISPLAY 180 DEGREES ********
    //transform: Rotation { origin.x: 512; origin.y: 300; angle: 180}

    // ******** SCREEN BACKGROUND ********
    Image {
        anchors.fill: parent
        source: "images/spark_display_5.jpg"
    }

    // ******** TESTING SLIDER ********
    Slider {
        id: sliderHorizontal
        x: 426
        y: 200
        width: 371
        height: 22
        minimumValue: 0
        maximumValue: 150
        onValueChanged: mdl.setSpeed(value)
    }

    // ******** GAUGES ********
    MC_gauge {
        id: mc_gauge
        x: 53
        y: 50
        value: mdl.MCTemp
    }

    Coolant_gauge {
        id: coolant_gauge
        x: 253
        y: 50
        value: mdl.MotorTemp
    }

    Battery_temp_gauge {
        id: battery_temp_gauge
        x: 672
        y: 50
        value: mdl.batteryTemp
    }

    Sum_voltage_gauge {
        id: sum_voltage_gauge
        x: 865
        y: 50
        value: mdl.packVoltage + mdl.cellVoltage // sum battery voltage + average cell voltage (for faulty cell)
    }

    // ******** CELL AND DC LINK TEXT ********
    Text{
        id: cell_voltage
        x: 671
        y: 446
        font.pixelSize: 20
        color: "white"
        text: "Cell Voltage:\n" + (mdl.cellVoltage).toFixed(2) // mdl.cellVoltage
    }
    Text{
        id: dc_link_voltage
        font.pixelSize: cell_voltage.font.pixelSize
        anchors.topMargin: 10
        anchors.top: cell_voltage.bottom
        anchors.left: cell_voltage.left
        color: "white"
        text: "DC link voltage:\n" + mdl.DCLinkV //mdl.DCLinkV
    }

    // ******** MPH AND CENTER CONSOLE ********
    Mph {
        id: mph_dashboard
        x: 420
        y: 13
        value: mdl.speed

        //controller temp, coolant temp, battery temp, sum battery voltage
        //mc_gauge.color, coolant_gauge.color, battery_temp_gauge.color, sum_voltage_gauge.color
        color: {
            if(mc_gauge.value > 60 || coolant_gauge.value > 50 || battery_temp_gauge.value >= 70){
                return "red"
            } else if (mc_gauge.value > 55 || coolant_gauge.value > 45 || battery_temp_gauge.value >= 65){
                return "yellow"
            }else{
                return "#4bbfdf"
            }
        }
    }

    // ******** HANDSHAKE CHECK AND PRECHARGE ALERT ********
    Handshake_check {
        id: handshake_check
        x: 495
        y: 350
        color: (mdl.handshake === true) ? "#90EE90" : "red"
    }

    Handshake_alert {
        id: handshake_alert
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
        visible: {
            if(control.pre_handshake === false){ return true } // control is not defined here, throwing runtime error
            else{ return false }
        }
    }

    // ******** LAUNCH CONTROL BUTTON ********
    Rectangle {
        width: 300
        height: 75
        anchors.horizontalCenter: parent.horizontalCenter
        y: 470
        color: "black"
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "CONTROLS"
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
            onPressed: rootlist.currentIndex = 0
        }
    }

}// END ITEM
