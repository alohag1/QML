import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 300
    height: 500
    title: "Traffic Light"
    color: "lightblue"


    Rectangle {
        id: background
        anchors.centerIn: parent
        width: 120
        height: 360
        color: "lightgrey"
        border.color: "black"
        border.width: 2
        radius: 10

        Rectangle {
            id: redLight
            anchors.horizontalCenter: parent.horizontalCenter
            y: 20
            width: 100
            height: 100
            radius: 50
            color: "black"
        }

        Rectangle {
            id: yellowLight
            anchors.horizontalCenter: parent.horizontalCenter
            y: 130
            width: 100
            height: 100
            radius: 50
            color: "black"
        }

        Rectangle {
            id: greenLight
            anchors.horizontalCenter: parent.horizontalCenter
            y: 240
            width: 100
            height: 100
            radius: 50
            color: "black"
        }

        states: [
            State {
                name: "stop"
                PropertyChanges { target: redLight; color: "#FF0000" }
                PropertyChanges { target: yellowLight; color: "black" }
                PropertyChanges { target: greenLight; color: "black" }
            },
            State {
                name: "caution"
                PropertyChanges { target: redLight; color: "black" }
                PropertyChanges { target: yellowLight; color: "#FFEB1E" }
                PropertyChanges { target: greenLight; color: "black" }
            },
            State {
                name: "go"
                PropertyChanges { target: redLight; color: "black" }
                PropertyChanges { target: yellowLight; color: "black" }
                PropertyChanges { target: greenLight; color: "#6AE900" }
            }
        ]

        state: "stop"

        transitions: [
            Transition {
                from: "stop"
                to: "caution"
                ColorAnimation { target: redLight; duration: 500 }
                ColorAnimation { target: yellowLight; duration: 500 }
            },
            Transition {
                from: "caution"
                to: "go"
                ColorAnimation { target: yellowLight; duration: 500 }
                ColorAnimation { target: greenLight; duration: 500 }
            },
            Transition {
                from: "go"
                to: "stop"
                ColorAnimation { target: greenLight; duration: 500 }
                ColorAnimation { target: redLight; duration: 500 }
            }
        ]

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (background.state === "stop") {
                    background.state = "caution";
                } else if (background.state === "caution") {
                    background.state = "go";
                } else {
                    background.state = "stop";
                }
            }
        }
    }
}
