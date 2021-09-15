import 'package:flutter/material.dart';

class Imenu extends StatelessWidget {
  const Imenu({Key? key, required this.nama, required this.gambar}) : super(key: key);
  final String nama;
  final String gambar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail: $nama"),),
      body: Container(
        child: Center(
          child: Image(image: NetworkImage(gambar),),
          // child: Image.asset("asset/img/sw_1.png"),
        ),
      ),
    );
  }
}

