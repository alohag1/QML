import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 400
    height: 600
    minimumWidth: 400
    title: "Task_for_Layout"

    property int fixedMargin: 10

    Rectangle {
        id: mainContent
        anchors.fill: parent
        color: "white"

        states: [
            State {
                name: "state1"
                PropertyChanges { target: headerText; text: "Header 1" }
                PropertyChanges { target: contentText; text: "Item 1 content" }
                PropertyChanges { target: backButton; visible: false }

                PropertyChanges { target: button1; font.bold: true; opacity: 1.0 }
                PropertyChanges { target: button2; font.bold: false; opacity: 0.5 }
                PropertyChanges { target: button3; font.bold: false; opacity: 0.5 }
            },
            State {
                name: "state2"
                PropertyChanges { target: headerText; text: "Header 2" }
                PropertyChanges { target: contentText; text: "Item 2 content" }
                PropertyChanges { target: backButton; visible: true }

                PropertyChanges { target: button1; font.bold: false; opacity: 0.5 }
                PropertyChanges { target: button2; font.bold: true; opacity: 1.0 }
                PropertyChanges { target: button3; font.bold: false; opacity: 0.5 }
            },
            State {
                name: "state3"
                PropertyChanges { target: headerText; text: "Header 3" }
                PropertyChanges { target: contentText; text: "Item 3 content" }
                PropertyChanges { target: backButton; visible: true }

                PropertyChanges { target: button1; font.bold: false; opacity: 0.5 }
                PropertyChanges { target: button2; font.bold: false; opacity: 0.5 }
                PropertyChanges { target: button3; font.bold: true; opacity: 1.0 }
            }
        ]

        transitions: [
            Transition {
                from: "*"
                to: "*"
                SequentialAnimation {
                    ParallelAnimation {
                        NumberAnimation { target: headerText; property: "opacity"; to: 0; duration: 200 }
                        NumberAnimation { target: contentText; property: "opacity"; to: 0; duration: 200 }
                    }
                    PauseAnimation { duration: 200 }
                    ScriptAction {
                        script: {
                            headerText.text = mainContent.state === "state1" ? "Header 1" :
                                              mainContent.state === "state2" ? "Header 2" : "Header 3";
                            contentText.text = mainContent.state === "state1" ? "Item 1 content" :
                                               mainContent.state === "state2" ? "Item 2 content" : "Item 3 content";
                        }
                    }
                    ParallelAnimation {
                        NumberAnimation { target: headerText; property: "opacity"; to: 1; duration: 300 }
                        NumberAnimation { target: contentText; property: "opacity"; to: 1; duration: 300 }
                    }
                }
            }
        ]

        Rectangle {
            id: header
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: 50
            color: "lightgray"

            Rectangle {
                id: backButton
                visible: false
                width: 40
                height: parent.height
                anchors.left: parent.left
                color: "transparent"
                Text {
                    anchors.centerIn: parent
                    text: "←"
                    font.pixelSize: 18
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        mainContent.state = "state1";
                    }
                }
            }

            Text {
                id: headerText
                anchors.centerIn: parent
                text: "Header"
                font.pixelSize: 15
                opacity: 1.0
            }
        }

        Rectangle {
            id: content
            anchors.top: header.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: buttonRow.top
            anchors.margins: fixedMargin
            color: "white"
            border.color: "gray"

            Text {
                id: contentText
                anchors.centerIn: parent
                text: "Some content"
                font.pixelSize: 15
                opacity: 1.0
            }
        }

        RowLayout {
            id: buttonRow
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            spacing: 15
            height: 55

            Button {
                id: button1
                padding: 16
                text: "Item 1"
                font.pixelSize: 18
                Layout.fillWidth: true
                height: parent.height
                font.bold: false
                opacity: 1.0
                onClicked: mainContent.state = "state1"
            }
            Button {
                id: button2
                padding: 16
                text: "Item 2"
                font.pixelSize: 18
                Layout.fillWidth: true
                height: parent.height
                font.bold: false
                opacity: 1.0
                onClicked: mainContent.state = "state2"
            }
            Button {
                id: button3
                padding: 16
                text: "Item 3"
                font.pixelSize: 18
                Layout.fillWidth: true
                height: parent.height
                font.bold: false
                opacity: 1.0
                onClicked: mainContent.state = "state3"
            }
        }
    }
}
