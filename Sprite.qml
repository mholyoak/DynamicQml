import QtQuick 2.0

Rectangle {
    id:idRect
    signal buttonClicked()
    width: 80;
    height: 50;
    color: "red";
    x:10;
    y:100
    property string fromCallee:'This value is send signal argument'
    signal send(string pass);
    MouseArea {
                  id: leftMouseArea
                  anchors.fill: parent
                  onClicked:idRect.buttonClicked()
              }
     Component.onCompleted:{
     forward.connect(fun2);
     send.connect(fun1);
     send(fromCallee);
     }
      function fun2(){
          console.log('signal received at dynamic object')
          console.log("value of main qml property 'count'="+count)
      }
}
