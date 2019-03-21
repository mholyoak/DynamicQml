import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    id:appWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property int count: 0
    property var dynObj: null
    signal forward
    function fun1(argument1){
     console.log("A function fun1()in the main QML file is invoked by dynmic object")
     console.log("Returned parameter from the QML dynamic objects = ", argument1)
     }

    Item {
        id: root
        width: parent.width
        height: parent.width
        function createItem() {
            Qt.createQmlObject("import QtQuick 2.5; Rectangle { x: 100; y: 100; width: 100; height: 100; color: \"blue\" }", root, "dynamicItem");
        }
    }

    Button{
        width: 200
        height: 50
        text:"Click Me"
        y:400
        x:350
        onClicked: {
            count++

            if (dynObj !== null) {
                dynObj.destroy(10)
            }


            //if(count==1)
                dynObj = Qt.createComponent("Sprite.qml").createObject(appWindow, {"x": (100 * count) % 400, "y": (100 * count) % 400});

            if(count===2){
                appWindow.forward()
            }
       }
   }
   onForward:console.log("forward signal is emitted in main QML")
}
