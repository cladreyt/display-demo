import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import "ui"

Item {
    width: 1024
    height:600

    // ******** BACKGROUND RECTANGLE ********
    Rectangle {
        width: parent.width
        height: parent.height
        color: "black"
    }

    // ******** LIGHTNING IMAGE ********
    Image {
        anchors {
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: 366
            verticalCenter: parent.verticalCenter
            verticalCenterOffset: -108
        }
        height: 500
        width: 450

        source: "images/cool_lightning.png"
    }

    // ******** PROGRESS BAR CREATED WITH RECTANGLES ********
    Rectangle {
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
            verticalCenterOffset: -160
        }
        width: 580
        height: 85
        color: "black"
        border.color: "white"
        border.width: 10
        Rectangle {
            id: progressRectangle
            anchors {
                left: parent.left
                leftMargin: 10
                verticalCenter: parent.verticalCenter
            }
            width: 0 // value, min = 0, max = 560
            height: parent.height - 20
            color: "#4bbfdf"
        }
    }

    // ******** CONTINUE BUTTON TO SWITCH BETWEEN SCREENS ********
    Rectangle {
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
            verticalCenterOffset: 200
        }
        width: 280
        height: 75
        color: "black"
        opacity: 0.2
        border.color: "gray"
        border.width: 5

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "CONTINUE"
            font.bold: true
            font.pixelSize: 32
            color: "gray"
        }

        MouseArea {
            id: continue_button
            anchors.fill: parent
            onPressed: rootlist.currentIndex = 1
        }
    }

    // ******** HANDSHAKE INDICATOR ********
    Handshake_check {
        id: handshake_check
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
            verticalCenterOffset: -20
        }
        color: (mdl.handshake === true) ? "lightgreen" : "red"
    }

    // ******** LAUNCH BUTTON ********
    Circle_gauge {
        id: launch_circle
        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
            verticalCenterOffset: 100
            horizontalCenterOffset: -300
        }

        primaryColor: "#4bbfdf"
        secondaryColor: "transparent"
        thirdColor: "black"
        button_text: "LAUNCH"
        size: 300

        MouseArea {
            id: launch_pressArea
            anchors.fill: parent
            onPressed: {
                launch_no_hold_timer.stop()
                launch_hold_timer.start()
            }

            onReleased: {
                launch_hold_timer.stop()
                launch_no_hold_timer.start()
            }
        }
    }

    // ******** DISCHARGE BUTTON ********
    Circle_gauge {
        id: discharge_circle
        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
            verticalCenterOffset: 100
            horizontalCenterOffset: 300
        }

        primaryColor: "red"
        secondaryColor: "transparent"
        thirdColor: "black"
        button_text: "DISCHARGE"
        size: 300

        MouseArea {
            id: discharge_pressArea
            anchors.fill: parent
            onPressed: {
                disc_no_hold.stop()
                disc_hold.start()
            }

            onReleased: {
                disc_hold.stop()
                disc_no_hold.start()
            }
        }
    }

    // ******** LAUNCH TIMER LOGIC ********
    Timer {
        id: launch_hold_timer
        interval: 3
        repeat: true
        onTriggered: {
            if (launch_circle.value < 1) launch_circle.value += 0.004;
            else if(launch_circle.value >= 1){
                launch_circle.full = 1;
                this.stop()
            }
        }
    }

    Timer {
        id: launch_no_hold_timer
        interval: 2
        repeat: true
        onTriggered: {
            if(launch_circle.full == 0){
                if (launch_circle.value >= 0.008) launch_circle.value -= 0.008
                else if (launch_circle.value < 0.008){
                    launch_circle.value = 0;
                    this.stop()
                }
            }else if(launch_circle.full == 1){
                launch_circle.value = 0;
                launch_circle.full = 0;
                this.stop();
                progressRectangle.color = "#4bbfdf"
                // here you start the actual precharge
                progressTimer.start();
            }
        }
    }

    // ******** DISCHARGE TIMER LOGIC ********
    Timer {
        id: disc_hold
        interval: 3
        repeat: true
        onTriggered: {
            if (discharge_circle.value < 1) discharge_circle.value += 0.004;
            else if(discharge_circle.value >= 1){
                discharge_circle.full = 1;
                this.stop()
            }
        }
    }

    Timer {
        id: disc_no_hold
        interval: 2
        repeat: true
        onTriggered: {
            if(discharge_circle.full == 0){
                if (discharge_circle.value >= 0.008) discharge_circle.value -= 0.008
                else if (discharge_circle.value < 0.008){
                    discharge_circle.value = 0;
                    this.stop()
                }
            }else if(discharge_circle.full == 1){
                discharge_circle.value = 0;
                discharge_circle.full = 0;
                this.stop();
                // here you start the actual discharge
                progressRectangle.color = "red"
                negProgressTimer.start();
            }
        }
    }

    // ******** PROGRESS TIMER LOGIC ********
    Timer {
        id: progressTimer
        interval: 1
        repeat: true
        onTriggered: {
            if(progressRectangle.width <= 560) progressRectangle.width += 0.2;
            else {
                //progressRectangle.color = "white" // only do this if handshake is good??
                this.stop();
            }
        }
    }

    Timer {
        id: negProgressTimer
        interval: 1
        repeat: true
        onTriggered: {
            if(progressRectangle.width >= 0) progressRectangle.width -= 0.2;
            else this.stop();
        }
    }
}
