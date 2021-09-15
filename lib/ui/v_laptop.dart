import 'package:flutter/material.dart';

class Laptop extends StatelessWidget {
  const Laptop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(20.0),),
            const Text("Daftar Panggilan", style: TextStyle(fontSize: 30.0, color: Colors.white)),
            const Padding(padding: EdgeInsets.all(20.0),),
            Image.asset("asset/img/sw_1.png", width: 350.0,)
          ],
        ),
      ),
    );
  }
}
