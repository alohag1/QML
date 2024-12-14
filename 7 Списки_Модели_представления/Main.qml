import QtQuick 2.15
import QtQuick.Controls 6.4

ApplicationWindow {
    visible: true
    width: 360
    height: 640
    title: "Messenger"

    Rectangle {
        width: parent.width
        height: parent.height
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#FFEC7A" }
            GradientStop { position: 1.0; color: "#8ABB55" }
        }

        ListView {
            id: messageListView
            width: parent.width
            height: parent.height - inputArea.height
            anchors.top: parent.top

            spacing: 10 

            model: ListModel {
                ListElement { sender: "User 1"; message: "Привет, как ты?"; time: "12:00" }
                ListElement { sender: "User 2"; message: "Хорошо, а ты?"; time: "12:01" }
            }

            delegate: Item {
                width: messageListView.width
                height: messageText.height + 30 

                Rectangle {
                    width: parent.width * 0.8
                    height: messageText.height + 30 
                    color: model.sender === "User 1" ? "#D6EAF8" : "#1B2E49"
                    radius: 8
                    border.color: "#B0BEC5"
                    border.width: 1
                    anchors.horizontalCenter: model.sender === "User 1" ? undefined : parent.horizontalCenter
                    anchors.right: model.sender === "User 1" ? parent.right : undefined
                    anchors.left: model.sender === "User 2" ? parent.left : undefined
                    anchors.margins: 5 

                    Column {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 5

                        Text {
                            id: messageText
                            text: model.message
                            wrapMode: Text.Wrap
                            width: parent.width - 20
                            color: model.sender === "User 1" ? "#333333" : "#ffffff"
                            font.pixelSize: 14
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.right: parent.right
                        }

                        Text {
                            id: timeText
                            text: model.time
                            font.pixelSize: 12
                            color: model.sender === "User 1" ? "#607D8B" : "#D3D3D3"
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                        }
                    }
                }
            }
        }

        Rectangle {
            id: inputArea
            width: parent.width
            height: 60
            color: "#ffffff"
            border.color: "#B0BEC5"
            border.width: 1
            anchors.bottom: parent.bottom

            Row {
                width: parent.width
                height: parent.height
                spacing: 0

                TextField {
                    id: messageInput
                    placeholderText: "Напишите соообщение..."
                    font.pixelSize: 14
                    color: "#333333"
                    background: Rectangle {
                        color: "#FFFFFF"
                        radius: 5
                        border.color: "#B0BEC5"
                        border.width: 1
                    }
                    height: parent.height
                    width: parent.width - 80
                    wrapMode: TextEdit.Wrap
                    padding: 10 
                }
                Button {
                    text: "Отправить"
                    width: 80
                    height: parent.height
                    anchors.right: parent.right
                    onClicked: {
                        if (messageInput.text !== "") {
                            messageListView.model.append({
                                sender: "User 1",
                                message: messageInput.text,
                                time: Qt.formatDateTime(new Date(), "hh:mm")
                            });

                            replyTimer.start();
                            messageInput.text = ""
                        }
                    }
                }
            }
        }

        Timer {
            id: replyTimer
            interval: 2000 // 2 секунды
            repeat: false
            onTriggered: {
                var replyIndex = messageListView.model.count % 5;
                var messages = [
                            "Кайф)",
                            "Сегодня был напряженный день, но все в порядке!",
                            "Сейчас я просто отдыхаю",
                            "Чем занимаешься?",
                            "Я собираюсь на тренировку завтра"

                ];
                messageListView.model.append({
                    sender: "User 2",
                    message: messages[replyIndex],
                    time: Qt.formatDateTime(new Date(), "hh:mm")
                });
            }
        }
    }
}
