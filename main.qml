import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import "ui"

ApplicationWindow {
    id: applicationWindow
    visible: true
    title: "fbs-display"

    // ******** DISPLAY PIXEL DIMENSIONS ********
    width: 1024
    height: 600

    ListView {
        id: rootlist
        width: parent.width
        height: parent.height

        model: VisualItemModel {
            Frame1 {}

            Item {
                width: rootlist.width
                height: rootlist.height
                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "lightgreen"
                    Text {
                        text: "Screen 2"
                        anchors.centerIn: parent
                    }
                }
            }
        }

        orientation: ListView.Horizontal
        //flickableDirection: Flickable.HorizontalFlick
        snapMode: ListView.SnapOneItem
        highlightRangeMode: ListView.StrictlyEnforceRange
        focus: true
    }

}// END APPLICATION WINDOW
