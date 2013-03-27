import QtQuick 1.1

Rectangle {
    id: page
    width: 500
    height: 500
    clip: true

    property int seconds
    property int duration: 35 * 60
    property int seuil1: 10*60
    property int seuil2: 5*60
    property int seuil3: 0*60

    anchors.fill: parent

    onSecondsChanged: {
        formatTime()
    }

    onWidthChanged: {
        text1.font.pixelSize = 0.5 * page.height
    }

    onHeightChanged: {
        text1.font.pixelSize = 0.5 * page.height
    }

    function timeChanged() {
        if(seconds >= duration) {

        } else {
            seconds++
            formatTime()
        }
    }

    function formatTime() {
        var remains = duration - seconds
        if(remains <= seuil3){
            page.state = "State3"
        }else if(remains <= seuil2){
            page.state = "State2"
        }else if(remains <= seuil1){
            page.state = "State1"
        }
        var min = Math.floor(remains / 60)
        var sec = remains % 60
        text2.text = min
        var secstr = sec
        if (secstr < 10) {
            secstr = "0" + secstr
        }
        text3.text = secstr

    }

    MouseArea {
        onClicked: {
            seconds = 0
            timer1.running = true
        }
        anchors.fill: parent
    }

    Rectangle {
        id: rectangle1
        color: "#00ff00"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.fill: parent
    }




    Text {
        id: text2
        text: "35"
        font.family: "Courier 10 Pitch"
        opacity: 1
        anchors.right: text1.left
        anchors.baseline: text1.baseline
        font.pixelSize: text1.font.pixelSize
    }

    Text {
        id: text1
        text: ":"
        font.family: "Courier 10 Pitch"
        anchors.centerIn: parent
        font.pixelSize: 0.5 * page.height
        onTextChanged:
            console.log("text changed!")
    }

    Text {
        id: text3
        text: "00"
        font.family: "Courier 10 Pitch"
        opacity: 1
        anchors.left: text1.right
        anchors.baseline: text1.baseline
        font.pixelSize: text1.font.pixelSize
    }

    Timer {
        id: timer1
        interval: 1000
        running: false
        repeat: true
        onTriggered: page.timeChanged()
    }



    states: [
        State {
            name: "State1"
            PropertyChanges {
                target: rectangle1
                color: "#ffff00"
            }
        },
        State {
            name: "State2"
            PropertyChanges {
                target: rectangle1
                color: "#ff7b00"
            }
        },
        State {
            name: "State3"
            PropertyChanges {
                target: rectangle1
                color: "#ff0000"
            }
        }
    ]

    transitions: [
        Transition {
            from: "*"
            to: "State1,State2,State3"
            ColorAnimation {
                easing.type: Easing.InOutQuad
                duration: 1000
                properties: "color"
            }
        }
    ]

}
