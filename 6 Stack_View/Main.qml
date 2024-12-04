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
        initialItem: pageYellow.createObject()  // Желтая страница будет основной
    }

    // Определяем компоненты для каждого экрана

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
                color: "#888"  // Серый цвет хедера

                // Название страницы
                Text {
                    anchors.centerIn: parent
                    text: "Page Green"
                    font.pixelSize: 24
                    color: "white"
                }

                // Кнопка для возврата на предыдущую страницу
                Button {
                    text: "←"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.margins: 10
                    visible: stackView.depth > 1  // Показываем кнопку только если в стеке есть другие страницы
                    onClicked: {
                        stackView.pop()  // Возвращаемся на предыдущую страницу
                    }
                }
            }

            // Контент страницы
            Text {
                anchors.centerIn: parent
                text: "Page Green"
                font.pixelSize: 24
                color: "white"
            }

            // Кнопка для перехода к желтому экрану
            Button {
                text: "To Yellow"
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.margins: 20
                onClicked: {
                    if (stackView.top !== pageYellow) {  // Проверка, если текущая страница не желтая
                        stackView.replace(pageYellow.createObject())  // Заменить текущую страницу на желтую
                    }
                }
            }

            // Кнопка для перехода к красному экрану
            Button {
                text: "To Red"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.margins: 20
                onClicked: {
                    if (stackView.top !== pageRed) {  // Проверка, если текущая страница не красная
                        stackView.replace(pageRed.createObject())  // Заменить текущую страницу на красную
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
                color: "#888"  // Серый цвет хедера

                // Название страницы
                Text {
                    anchors.centerIn: parent
                    text: "Page Yellow"
                    font.pixelSize: 24
                    color: "black"
                }

                // Кнопка для возврата на предыдущую страницу
                Button {
                    text: "←"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.margins: 10
                    visible: stackView.depth > 1  // Показываем кнопку только если в стеке есть другие страницы
                    onClicked: {
                        stackView.pop()  // Возвращаемся на предыдущую страницу
                    }
                }
            }

            // Контент страницы
            Text {
                anchors.centerIn: parent
                text: "Page Yellow"
                font.pixelSize: 24
                color: "black"
            }

            // Кнопка для перехода к зеленому экрану
            Button {
                text: "To Green"
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.margins: 20
                onClicked: {
                    if (stackView.top !== pageGreen) {  // Проверка, если текущая страница не зеленая
                        stackView.replace(pageGreen.createObject())  // Заменить текущую страницу на зеленую
                    }
                }
            }

            // Кнопка для перехода к красному экрану
            Button {
                text: "To Red"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.margins: 20
                onClicked: {
                    if (stackView.top !== pageRed) {  // Проверка, если текущая страница не красная
                        stackView.replace(pageRed.createObject())  // Заменить текущую страницу на красную
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

            // Хедер
            Rectangle {
                width: parent.width
                height: 50
                color: "#888"  // Серый цвет хедера

                // Название страницы
                Text {
                    anchors.centerIn: parent
                    text: "Page Red"
                    font.pixelSize: 24
                    color: "white"
                }

                // Кнопка для возврата на предыдущую страницу
                Button {
                    text: "←"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.margins: 10
                    visible: stackView.depth > 1  // Показываем кнопку только если в стеке есть другие страницы
                    onClicked: {
                        stackView.pop()  // Возвращаемся на предыдущую страницу
                    }
                }
            }

            // Контент страницы
            Text {
                anchors.centerIn: parent
                text: "Page Red"
                font.pixelSize: 24
                color: "white"
            }

            // Кнопка для перехода к зеленому экрану
            Button {
                text: "To Green"
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.margins: 20
                onClicked: {
                    if (stackView.top !== pageGreen) {  // Проверка, если текущая страница не зеленая
                        stackView.replace(pageGreen.createObject())  // Заменить текущую страницу на зеленую
                    }
                }
            }

            // Кнопка для перехода к желтому экрану
            Button {
                text: "To Yellow"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.margins: 20
                onClicked: {
                    if (stackView.top !== pageYellow) {  // Проверка, если текущая страница не желтая
                        stackView.replace(pageYellow.createObject())  // Заменить текущую страницу на желтую
                    }
                }
            }
        }
    }
}
