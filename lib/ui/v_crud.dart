import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Crud extends StatefulWidget {
  const Crud({Key? key}) : super(key: key);

  @override
  _CrudState createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('pelanggan').snapshots();
  String title="Learn CRUD";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          leading: IconButton(onPressed: ()=>Navigator.pop(context, false),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white)
          ),
          centerTitle: true,
          title: Text(title),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                  )
                ],
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return ListTile(
                  title: Text(data['kode']),
                  subtitle: Text(data['nama_pelanggan'], style: const TextStyle(color: Colors.black),),
                  onTap: (){},
                );
              }).toList(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          child: const Icon(Icons.add),
          onPressed: (){},
        ),
      ),
    );
  }
}
