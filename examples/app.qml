import xbqmlplugin
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window

Window {
    width: 640
    height: 400
    visible: true

    signal buttonClicked

    Timer {
        repeat: true
        running: true
        interval: 100
        onTriggered: {
            speechIndicator.power = Math.random() * 100
            speechWaveIndicator.power = Math.random() * 100
        }
    }

    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true

            SpeechIndicator {
                id: speechIndicator
                power: 100
                color: "blue"
                Layout.fillWidth: true
                Layout.fillHeight: true

                Behavior on power {
                    PropertyAnimation {
                        easing.type: Easing.InOutQuad
                    }
                }
            }

            SpeechWaveIndicator {
                id: speechWaveIndicator
                power: 100
                color: "salmon"
                Layout.preferredWidth: parent.width * 2 / 3
                Layout.fillHeight: true

                //            Behavior on power {
                //                PropertyAnimation {
                //                    easing.type: Easing.InOutQuad
                //                }
                //            }
            }
        }

        StateSelector {
            Layout.fillWidth: true
            Layout.margins: 4

            textColor: "green"
            textFont.family: "Arial"
            textFont.bold: true
            textFont.italic: true
            sliderSpeed: 1000
            sliderColor: "salmon"

            displayStates: [{
                    "name": "aaa",
                    "color": "red"
                }, {
                    "name": "bbb",
                    "color": "transparent"
                }, {
                    "name": "ccc",
                    "color": "yellow"
                }]
        }

        TagsField {
            Layout.fillWidth: true
            Layout.preferredHeight: 40

            model: ["test", "top", "top", "top", "top", "top", "top"]
        }

        TagsArea {
            Layout.fillWidth: true
            Layout.preferredHeight: 100

            model: ["test", "top", "top", "top", "top", "top", "top"]
        }

        Row {
            Image {
                source: {
                    Refresher.registerBinding()
                    Qt.resolvedUrl(qsTr("asset:/image.png"))
                }
            }
            Button {
                text: "Click"
                onClicked: {
                    buttonClicked()
                    Refresher.refreshAll()
                }
            }
        }
    }
}
