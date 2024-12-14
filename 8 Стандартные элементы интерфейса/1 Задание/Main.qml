import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: "Task_for_Login_Page"
    minimumWidth: 300
    minimumHeight: 300

    Column {
        anchors.centerIn: parent
        spacing: 10

        TextField {
            id: usernameField
            width: 200
            placeholderText: "Username"
        }

        TextField {
            id: passwordField
            width: 200
            placeholderText: "Password"
            echoMode: TextInput.Password
        }

        Row {
            spacing: 10
            anchors.horizontalCenter: parent

            Button {
                text: "Log In"
                enabled: usernameField.text !== "" && passwordField.text !== ""
                onClicked: console.log("Logging in with:", usernameField.text, passwordField.text)
            }

            Button {
                text: "Clear"
                onClicked: {
                    usernameField.text = ""
                    passwordField.text = ""
                }
            }
        }
    }
}
