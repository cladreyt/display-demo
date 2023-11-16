import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import "ui"

ApplicationWindow {
    id: applicationWindow
    visible: true
    title: "fbs-display" //setting the title of the window on your laptop etc

    // ******** DISPLAY PIXEL DIMENSIONS ********
    width: 1024
    height: 600

    // ******** LIST OF SCREENS VERTICALLY ********
    ListView {
        id: rootlist
        width: parent.width
        height: parent.height

        // ******** ROTATING THE DISPLAY 180 DEGREES ********
        //transform: Rotation { origin.x: 512; origin.y: 300; angle: 180}

        model: VisualItemModel {
            Frame2 {}

            Frame1 {}
        }

        orientation: ListView.Vertical
        //flickableDirection: Flickable.HorizontalFlick
        snapMode: ListView.SnapToItem
        highlightRangeMode: ListView.StrictlyEnforceRange

        highlightMoveDuration: 400
        highlightMoveVelocity: -1

        boundsBehavior: Flickable.StopAtBounds
        interactive: false
        currentIndex: 0


    }// END LIST OF SCREENS

}// END APPLICATION WINDOW
