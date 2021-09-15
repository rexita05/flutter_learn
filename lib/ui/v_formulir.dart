import 'dart:async';

import 'package:flutter/material.dart';

class Formulir extends StatefulWidget {
  const Formulir({Key? key}) : super(key: key);

  @override
  _FormulirState createState() => _FormulirState();
}

class _FormulirState extends State<Formulir> {
  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  String _jk="";

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerDesc = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  String _agamaVal="Islam";
  List agama = ['Islam','Kristen','Hindu','Budha'];
  final _formKey = GlobalKey<FormState>();

  void pilihAgama(value){
    setState(() {
      _agamaVal=value;
    });
  }
  void _pilihJk(String value){
    setState(() {
      _jk=value;
    });
  }
  void kirimData(){
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        height: 200,
        child: Column(
          children: [
            Text("Nama Lengkap : ${controllerName.text}"),
            Text("Description : ${controllerDesc.text}"),
            Text("Password : ${controllerPass.text}"),
            Text("Gender : $_jk"),
            Text("Agama : $_agamaVal"),
            RaisedButton(
                child: const Text("Ok"),
                onPressed: ()=>Navigator.pop(context)
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
  }

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    setState(() {
      _isPasswordEightCharacters = false;
      if(password.length >= 8) {
        _isPasswordEightCharacters = true;
      }

      _hasPasswordOneNumber = false;
      if(numericRegex.hasMatch(password)) {
        _hasPasswordOneNumber = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Navigator.pop(context, false),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white)
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text("Add Formulir"),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: controllerName,
                  decoration: const InputDecoration(
                    // prefixIcon: Icon(Icons.account_circle_outlined),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(5),
                    //   borderSide: BorderSide(color: Colors.teal),
                    // ),
                      labelText: "Full Name",
                      hintText: "Full Name"
                  ),
                ),
                TextField(
                  controller: controllerDesc,
                  decoration: const InputDecoration(
                    // prefixIcon: Icon(Icons.account_circle_outlined),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(5),
                    //   borderSide: BorderSide(color: Colors.teal),
                    // ),
                      labelText: "Description",
                      hintText: "Description"
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 5)),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value.length<8) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: controllerPass,
                  onChanged: (password) => onPasswordChanged(password),
                  obscureText: !_isVisible,
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.security_outlined),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(5),
                    //   borderSide: BorderSide(color: Colors.teal),
                    // ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _isVisible=!_isVisible;
                          });
                        },
                        icon: _isVisible ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined),
                      ),
                      labelText: "Password",
                      hintText: "Password"
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 5)),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: _isPasswordEightCharacters ?  Colors.green : Colors.transparent,
                          border: _isPasswordEightCharacters ? Border.all(color: Colors.transparent) :
                          Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                    ),
                    const SizedBox(width: 10,),
                    const Text("Contains at least 8 characters")
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 5)),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: _hasPasswordOneNumber ?  Colors.green : Colors.transparent,
                          border: _hasPasswordOneNumber ? Border.all(color: Colors.transparent) :
                          Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                    ),
                    const SizedBox(width: 10,),
                    const Text("Contains at least 1 number")
                  ],
                ),
                RadioListTile(
                  value: "laki",
                  title: const Text("Laki-laki"),
                  groupValue: _jk,
                  onChanged: (String? value){
                    _pilihJk(value!);
                  },
                  activeColor: Colors.teal,
                  subtitle: const Text("Gender Male"),
                ),
                RadioListTile(
                  value: "perempuan",
                  title: const Text("Perempuan"),
                  groupValue: _jk,
                  onChanged: (String? value){
                    _pilihJk(value!);
                  },
                  activeColor: Colors.teal,
                  subtitle: const Text("Gender Male"),
                ),
                DropdownButton(
                  value: _agamaVal,
                  isExpanded: true,
                  hint: const Text("Pilih agama"),
                  onChanged: (value){
                    pilihAgama(value);
                  },
                  items: agama.map((value){
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),);
                  }).toList(),
                ),
                RaisedButton(
                  child: Text("Send"),
                  color: Colors.blue,
                  onPressed: (){
                    // if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    // Timer(Duration(seconds: 4),(){
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('Processing Data')),
                    //   );
                    //   // }
                    // });
                    kirimData();
                  }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
