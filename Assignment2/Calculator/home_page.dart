import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var media=MediaQuery.of(context).size;
  var num1=0,num2=0,result=0;
  TextEditingController t1=new TextEditingController(text: "0");
  TextEditingController t2=new TextEditingController(text: "0");

  _getTextField(String hint,var controler){
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
      ),
      controller: controler,
    );
  }
  _getRaisedBtn(String txt,var bColor,Function fn){
      return Container(
        child: MaterialButton(
          onPressed: (){
            fn();
          },
          padding: EdgeInsets.all((10.0)),
          color: bColor,
          child: Text(
            txt,
              style: TextStyle(fontSize: 23),
          ),
        ),
      );
    }
    add(){
      setState(() {
        num1=int.tryParse(t1.text);
        num2=int.tryParse(t2.text);
        result=num1+num2;
      });
    }
    sub(){
      setState(() {
        num1=int.tryParse(t1.text);
        num2=int.tryParse(t2.text);
        result=num1-num2;
      });
    }
    mul(){
      setState(() {
        num1=int.tryParse(t1.text);
        num2=int.tryParse(t2.text);
        result=num1*num2;
      });
    }
    div(){
      setState(() {
        num1=int.tryParse(t1.text);
        num2=int.tryParse(t2.text);
        result= num1~/num2;
      });
    }
    doClear(){
      setState(() {
        t1.clear();
        t2.clear();
        result=0;
      });
    }

  @override
  Widget build(BuildContext context) {
    var media=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Calculator",style: TextStyle(fontSize: 20),),),
      body: Container(
        padding: EdgeInsets.all(media.width/60),
        child: Expanded(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget> [
                Text("Output:$result",style: TextStyle(
                  fontSize: media.width/20,
                  fontWeight:FontWeight.bold,
                  color: Colors.purpleAccent,
                ),),
                _getTextField("enter numner 1",t1),
                _getTextField("enter numner 2",t2),
                Padding(padding:EdgeInsets.all(media.width/60)),
                     Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _getRaisedBtn('+', Colors.greenAccent,add),
                      _getRaisedBtn('-', Colors.greenAccent,sub),
                    
                    ],
                ),
                Padding(padding: EdgeInsets.all(media.width/60)),
                     Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _getRaisedBtn('*', Colors.greenAccent,mul),
                      _getRaisedBtn('/', Colors.greenAccent,div),
                     
                    ],
                ),
                Padding(padding: EdgeInsets.all(media.width/60)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    _getRaisedBtn("Clear", Colors.black12,doClear),
                  ]
                )
                 
          ],),
        )
      ),
    );
  }
}
