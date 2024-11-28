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
            font.pixelSize: parent.height * 0.3
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
            text: "Content"
            font.pixelSize: headerText.font.pixelSize
        }
    }

    RowLayout {
        id: buttonRow
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        spacing: fixedMargin
        height: header.height

        Button {
            id: button1
            padding: 16
            text: "1"
            font.pixelSize: headerText.font.pixelSize
            Layout.fillWidth: true
            height: parent.height
            onClicked: {
                headerText.text = "Header"
                contentText.text = "Content"
            }
        }
        Button {
            id: button2
            padding: 16
            text: "2"
            font.pixelSize: headerText.font.pixelSize
            Layout.fillWidth: true
            height: parent.height
            onClicked: {
                headerText.text = "Header"
                contentText.text = "Content"
            }
        }
        Button {
            id: button3
            padding: 16
            text: "3"
            font.pixelSize: headerText.font.pixelSize
            Layout.fillWidth: true
            height: parent.height
            onClicked: {
                headerText.text = "Header"
                contentText.text = "Content"
            }
        }
    }
}
