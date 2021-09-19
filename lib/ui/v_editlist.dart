import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import './v_crud.dart' as crud;

class EditData extends StatefulWidget {
  // const EditData({Key? key}) : super(key: key);
  const EditData({Key? key, required this.kode, required this.nama_pelanggan, required this.material, required this.index}) : super(key: key);

  final String kode;
  final String nama_pelanggan;
  final String material;
  final index;

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  final TextEditingController controllerKode = TextEditingController();
  final TextEditingController controllerNamaPelanggan = TextEditingController();
  final TextEditingController controllerMaterial = TextEditingController();

  String kodePel='';
  String namaPel='';
  String materialPel='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerKode.text = widget.kode;
    controllerNamaPelanggan.text = widget.nama_pelanggan;
    controllerMaterial.text = widget.material;

    kodePel=widget.kode;
    namaPel=widget.nama_pelanggan;
    materialPel=widget.material;
  }

  _updateData(){
    FirebaseFirestore.instance.runTransaction((transaction)async{
      DocumentSnapshot snapshot = await transaction.get(widget.index);
      await transaction.update(snapshot.reference,{
        "kode":kodePel,
        "nama_pelanggan":namaPel,
        "material":materialPel
      });
    });
    Navigator.pop(context);
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
        title: const Text("Edit Data"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: controllerKode,
                  onChanged: (String value){
                    setState(() {
                      kodePel=value;
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
                  controller: controllerNamaPelanggan,
                  onChanged: (String value){
                    setState(() {
                      namaPel=value;
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
                  controller: controllerMaterial,
                  onChanged: (String value){
                    setState(() {
                      materialPel=value;
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
          _updateData();
        },
      ),
    );
  }
}
