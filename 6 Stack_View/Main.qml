import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Переключение экранов"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: pageYellow.createObject() 
    }

    Component {
        id: pageGreen
        Rectangle {
            width: parent.width
            height: parent.height
            color: "green"

            // Хедер
            Rectangle {
                width: parent.width
                height: 50
                color: "#888"

                // Название страницы
                Text {
                    anchors.centerIn: parent
                    text: "Page Green"
                    font.pixelSize: 24
                    color: "white"
                }

                Button {
                    text: "←"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.margins: 10
                    visible: stackView.depth > 1 
                    onClicked: {
                        stackView.pop()
                    }
                }
            }

            Text {
                anchors.centerIn: parent
                text: "Page Green"
                font.pixelSize: 24
                color: "white"
            }

            Button {
                text: "To Yellow"
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.margins: 20
                onClicked: {
                    if (stackView.top !== pageYellow) { 
                        stackView.replace(pageYellow.createObject())
                    }
                }
            }

            Button {
                text: "To Red"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.margins: 20
                onClicked: {
                    if (stackView.top !== pageRed) { 
                        stackView.replace(pageRed.createObject())
                    }
                }
            }
        }
    }

    Component {
        id: pageYellow
        Rectangle {
            width: parent.width
            height: parent.height
            color: "yellow"

            // Хедер
            Rectangle {
                width: parent.width
                height: 50
                color: "#888"

                Text {
                    anchors.centerIn: parent
                    text: "Page Yellow"
                    font.pixelSize: 24
                    color: "black"
                }
                Button {
                    text: "←"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.margins: 10
                    visible: stackView.depth > 1 
                    onClicked: {
                        stackView.pop()
                    }
                }
            }

            Text {
                anchors.centerIn: parent
                text: "Page Yellow"
                font.pixelSize: 24
                color: "black"
            }
            Button {
                text: "To Green"
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.margins: 20
                onClicked: {
                    if (stackView.top !== pageGreen) { 
                        stackView.replace(pageGreen.createObject())
                    }
                }
            }

            Button {
                text: "To Red"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.margins: 20
                onClicked: {
                    if (stackView.top !== pageRed) { 
                        stackView.replace(pageRed.createObject())
                    }
                }
            }
        }
    }

    Component {
        id: pageRed
        Rectangle {
            width: parent.width
            height: parent.height
            color: "red"

            Rectangle {
                width: parent.width
                height: 50
                color: "#888"

                Text {
                    anchors.centerIn: parent
                    text: "Page Red"
                    font.pixelSize: 24
                    color: "white"
                }
                Button {
                    text: "←"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.margins: 10
                    visible: stackView.depth > 1
                    onClicked: {
                        stackView.pop()
                    }
                }
            }

            Text {
                anchors.centerIn: parent
                text: "Page Red"
                font.pixelSize: 24
                color: "white"
            }

            Button {
                text: "To Green"
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.margins: 20
                onClicked: {
                    if (stackView.top !== pageGreen) {
                        stackView.replace(pageGreen.createObject())
                    }
                }
            }

            Button {
                text: "To Yellow"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.margins: 20
                onClicked: {
                    if (stackView.top !== pageYellow) { 
                        stackView.replace(pageYellow.createObject()) 
                    }
                }
            }
        }
    }
}
