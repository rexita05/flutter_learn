import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_learn/ui/v_crud.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'dart:async';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  // late DateTime _dueDate=DateTime.now();
  // String _dateText="";
  // Future<Null> _selectDueDate(BuildContext context) async {
  //   final picked = await showDatePicker(context: context, initialDate: _dueDate, firstDate: DateTime(2021), lastDate: DateTime(2025));
  //   if(picked != null){
  //     setState(() {
  //       _dueDate=picked;
  //       _dateText="${picked.day}/${picked.month}/${picked.year}";
  //     });
  //   }
  // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _dateText="${_dueDate.day}/${_dueDate.month}/${_dueDate.year}";
  // }
  String kode='';
  String nama='';
  String material='';

  void _addData(){
    FirebaseFirestore.instance.runTransaction((Transaction transaction)async{
      CollectionReference reference=FirebaseFirestore.instance.collection('pelanggan');
      await reference.add({
        "kode":kode,
        "nama_pelanggan":nama,
        "material":material
      });
    });
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>const Crud()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Navigator.pop(context, false),
          icon: const Icon(Icons.arrow_back_ios), color: Colors.white,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text("Add Data"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  onChanged: (String value){
                    setState(() {
                      kode=value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.teal),
                    ),
                      labelText: "Kode Pelanggan",
                      hintText: "RXH-2021-000001"
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                TextField(
                  onChanged: (String value){
                    setState(() {
                      nama=value;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.teal),
                      ),
                      labelText: "Nama Pelanggan",
                      hintText: "Muhammad Rexita"
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                TextField(
                  onChanged: (String value){
                    setState(() {
                      material=value;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.teal),
                      ),
                      labelText: "Material",
                      hintText: "UTP/Router/Converter"
                  ),
                ),

                // Padding(padding: EdgeInsets.only(top: 10)),
                // TextField(
                //   readOnly: true,
                //   onTap: (){
                //     setState(() {
                //       _selectDueDate(context);
                //     });
                //   },
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(5),
                //         borderSide: const BorderSide(color: Colors.teal),
                //       ),
                //       labelText: "Tanggal",
                //       hintText: "Day/Month/Year"
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: const Icon(Icons.save_outlined),
        onPressed: (){
          _addData();
        },
      ),
    );
  }
}
