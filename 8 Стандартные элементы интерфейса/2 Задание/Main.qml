import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 300
    height: 400
    title: "Task_for_Login_Page"
    minimumWidth: 350
    minimumHeight: 400

    property string password: ""
    property int maxLength: 6

    Column {
        anchors.centerIn: parent
        spacing: 15

        Text {
            text: "Enter your password:"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Row {
            spacing: 5
            anchors.horizontalCenter: parent.horizontalCenter

            Repeater {
                model: maxLength

                Text {
                    text: "*"
                    font.pixelSize: 30
                    color: "black"
                    opacity: index < password.length ? 1.0 : 0.3
                }
            }
        }

        GridLayout {
            columns: 3
            rowSpacing: 5
            columnSpacing: 5
            anchors.horizontalCenter: parent.horizontalCenter

                Button { text: "1"; font.pixelSize: 25; onClicked: if (password.length < maxLength) password += "1" }
                Button { text: "2"; font.pixelSize: 25; onClicked: if (password.length < maxLength) password += "2" }
                Button { text: "3"; font.pixelSize: 25; onClicked: if (password.length < maxLength) password += "3" }

                Button { text: "4"; font.pixelSize: 25; onClicked: if (password.length < maxLength) password += "4" }
                Button { text: "5"; font.pixelSize: 25; onClicked: if (password.length < maxLength) password += "5" }
                Button { text: "6"; font.pixelSize: 25; onClicked: if (password.length < maxLength) password += "6" }

                Button { text: "7"; font.pixelSize: 25; onClicked: if (password.length < maxLength) password += "7" }
                Button { text: "8"; font.pixelSize: 25; onClicked: if (password.length < maxLength) password += "8" }
                Button { text: "9"; font.pixelSize: 25; onClicked: if (password.length < maxLength) password += "9" }

            Rectangle {
                width: 100
                height: 43
                color: "lightgray"
                enabled: false
            }
            Button { text: "0"; font.pixelSize: 25; onClicked: if (password.length < maxLength) password += "0" }
            Button { text: "Clear";font.pixelSize: 25; onClicked: password = "" }
        }

        Row {
            anchors.left: parent.left

            Button {
                text: "Log In"
                width: 100
                height: 40
                font.pixelSize: 20
                onClicked: {
                    console.log("Entered password:", password)
                }
            }
        }
    }
}
