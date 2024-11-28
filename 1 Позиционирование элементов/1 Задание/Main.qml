import QtQuick
import QtQuick.Window
import Felgo

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    id: win

    Item {
        id: root
        anchors.fill: parent

        // Корпус машины
        Rectangle {
            id: rect_darkYellow
            x: 200
            y: 200
            width: 250
            height: 90
            color: "#b5a519"
        }

        // Окно машины
        Cubik {
            anchors.horizontalCenter: rect_darkYellow.horizontalCenter
            anchors.top: rect_darkYellow.top
            anchors.topMargin: -50
        }

        // Левое колесо
        Rectangle {
            width: 50
            height: 50
            radius: 25
            color: "black"
            x: rect_darkYellow.x + 10
            y: rect_darkYellow.y + rect_darkYellow.height - 25
        }

        // Правое колесо
        Rectangle {
            width: 50
            height: 50
            radius: 25
            color: "black"
            x: rect_darkYellow.x + rect_darkYellow.width - 60
            y: rect_darkYellow.y + rect_darkYellow.height - 25
        }

        // Логотип такси
        Repeater {
            model: 5
            Rectangle {
                width: 20
                height: 20
                color: index % 2 === 0 ? "black" : "#b5a519"
                x: rect_darkYellow.x + 72 + index * 20
                y: rect_darkYellow.y + 50
            }
        }
    }
}
