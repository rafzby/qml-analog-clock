import QtQuick 2.0
import QtQuick.Controls 2.2

Item {
    id: clock
    width: 600
    height: 600
    anchors.centerIn: parent

    property int hours
    property int minutes
    property int seconds


    function timeChanged() {
        var date = new Date();
        hours = date.getHours();
        minutes = date.getMinutes();
        seconds = date.getSeconds();
    }

    Timer {
        interval: 100
        repeat: true
        running: true
        onTriggered: timeChanged()
    }

    Image {
        id: clockFace
        source: "assets/clock-face.png"
    }

    Image {
        id: hourHand
        x: 294; y: 140
        width: 10
        height: 174
        source: "assets/hour.png"
        transform: Rotation {
            id: hourRotation
            angle: (clock.hours * 30)
            origin.x: 5
            origin.y: 164

            Behavior on angle {
                SpringAnimation {
                    spring: 2
                    damping: 0.2
                    modulus: 360
                }
            }
        }
    }

    Image {
        id: minuteHand
        source: "assets/minute.png"
        x: 295; y: 93
        width: 10
        height: 221
        transform: Rotation {
            id: minuteRotation
            angle: clock.minutes * 6
            origin.x: 5
            origin.y: 211
            Behavior on angle {
                SpringAnimation {
                    spring: 2
                    damping: 0.2
                    modulus: 360
                }
            }
        }
    }

    Image {
        id: secondHand
        source: "assets/second.png"
        x: 297; y: 42
        width: 5
        height: 273
        transform: Rotation {
            id: secondRotation
            angle: clock.seconds * 6
            origin.x: 2.5
            origin.y: 263

            Behavior on angle {
                SpringAnimation {
                    spring: 2
                    damping: 0.2
                    modulus: 360
                }
            }
        }
    }

    Rectangle {
        x: 285
        y: 292
        color: "black"
        width: 30
        height: 30
        radius: 50
    }
}
