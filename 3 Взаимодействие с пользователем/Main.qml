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
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 50
        color: "lightgray"
        Text {
            id: headerText
            anchors.centerIn: parent
            text: "Header"
            font.pixelSize: 15
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
            onClicked: {
                headerText.text = "Header 1"
                contentText.text = "Item 1 content"

                button1.font.bold = true
                button1.opacity = 1.0

                button2.font.bold = false
                button2.opacity = 0.5

                button3.font.bold = false
                button3.opacity = 0.5
            }
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
            onClicked: {
                headerText.text = "Header 2"
                contentText.text = "Item 2 content"

                button1.font.bold = false
                button1.opacity = 0.5

                button2.font.bold = true
                button2.opacity = 1.0

                button3.font.bold = false
                button3.opacity = 0.5
            }
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
            onClicked: {
                headerText.text = "Header 3"
                contentText.text = "Item 3 content"

                button1.font.bold = false
                button1.opacity = 0.5

                button2.font.bold = false
                button2.opacity = 0.5

                button3.font.bold = true
                button3.opacity = 1.0
            }
        }
    }
}
