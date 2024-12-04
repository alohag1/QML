import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 300
    height: 500
    title: "Scrollable Traffic Light"
    color: "lightblue"

    SwipeView {
        id: trafficLightView
        anchors.fill: parent
        interactive: true

        Item {
            Rectangle {
                id: redPage
                anchors.centerIn: parent
                width: 120
                height: 360
                color: "lightgrey"
                border.color: "black"
                border.width: 2
                radius: 10

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 20
                    width: 100
                    height: 100
                    radius: 50
                    color: "#FF0000"
                }
            }
        }

        Item {
            Rectangle {
                id: yellowPage
                anchors.centerIn: parent
                width: 120
                height: 360
                color: "lightgrey"
                border.color: "black"
                border.width: 2
                radius: 10

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 130
                    width: 100
                    height: 100
                    radius: 50
                    color: "#FFEB1E"
                }
            }
        }
        Item {
            Rectangle {
                id: greenPage
                anchors.centerIn: parent
                width: 120
                height: 360
                color: "lightgrey"
                border.color: "black"
                border.width: 2
                radius: 10

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 240
                    width: 100
                    height: 100
                    radius: 50
                    color: "#6AE900"
                }
            }
        }
    }

    PageIndicator {
        id: pageIndicator
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        count: trafficLightView.count
        currentIndex: trafficLightView.currentIndex

        delegate: Rectangle {
            width: 12
            height: 12
            radius: 6
            color: index === pageIndicator.currentIndex ? "black" : "white"
            anchors.margins: 5
        }
    }
}
