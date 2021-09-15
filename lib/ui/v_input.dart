import 'package:flutter/material.dart';

class Tulisan extends StatefulWidget {

  @override
  _TextState createState() => _TextState();
}

class _TextState extends State<Tulisan> {
  String input="";
  TextEditingController controllerInput = TextEditingController();
  TextEditingController controllerAlert = TextEditingController();
  TextEditingController controllerSnackbar = TextEditingController();
  void _alertdialog(String str){
    if(str.isEmpty) return;
    AlertDialog alertDialog = AlertDialog(
      content: Text(str, style: const TextStyle(fontSize: 20.0),),
      actions: <Widget>[
        RaisedButton(
          color: Colors.grey,
          child: const Text("Ok"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
  }
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  void _snackbar(String str){
    if(str.isEmpty)return;
    _scaffoldState.currentState!.showSnackBar(SnackBar(
      content: Text(str, style: const TextStyle(fontSize: 20.0),),
      duration: const Duration(seconds: 5),
    ));
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldState,
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: controllerInput,
                decoration: const InputDecoration(
                    hintText: "Type here !!!",
                    labelText: "Input"
                ),
                onSubmitted: (String str){
                  setState(() {
                    input=str+'\n'+input;
                    controllerInput.text="";
                  });
                },
              ),
              Text(input, style: TextStyle(fontSize: 30.0),),
              TextField(
                controller: controllerAlert,
                decoration: const InputDecoration(
                    hintText: "Type alert !!!",
                    labelText: "Alert"
                ),
                onSubmitted: (String str){
                  _alertdialog(str);
                  controllerAlert.text="";
                },
              ),

              TextField(
                controller: controllerSnackbar,
                decoration: const InputDecoration(
                    hintText: "Type snackbar !!!",
                    labelText: "Snackbar"
                ),
                onSubmitted: (String str){
                  _snackbar(str);
                  controllerSnackbar.text="";
                },
              ),
            ],
          )
      ),
    );
  }
}
