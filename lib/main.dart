import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './ui/v_komputer.dart' as komputer;
import './ui/v_laptop.dart' as laptop;
import './ui/v_listview.dart' as list;
import './ui/v_input.dart' as input;
import './ui/v_sidebar.dart' as detail;
import './ui/v_formulir.dart' as formulir;
import './ui/v_login.dart' as login;
import './ui/v_google.dart' as signin;
import './ui/v_crud.dart' as crud;
import 'package:firebase_core/firebase_core.dart';
// import './ui/page_radio.dart' as radio;
// import './ui/page_sound.dart' as sound;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Flutter Learn",
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>const Home()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("asset/img/splash.png", height: 120,),
            const SizedBox(height: 20,),
            const Text("FLUTTER LEARN", style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  late TabController controller;
  String gambar1="https://pbs.twimg.com/profile_images/1417058955679780866/cXgFBJmp.jpg";
  String gambar2="https://fixioner.com/wp-content/uploads/2021/08/Gambar-Kakek-Merah-PNG-HD-2-min-774x1024.png";
  late String backup;

  String nama1="Bragas Rexita E.";
  String nama2="Rexita Audio";
  late String backupnama;

  String email1="bragazrexi@gmail.com";
  String email2="rexita.audio@gmail.com";
  late String backupemail;
  void changeuser(){
    setState(() {
      backup=gambar1;
      gambar1=gambar2;
      gambar2=backup;

      backupnama=nama1;
      nama1=nama2;
      nama2=backupnama;

      backupemail=email1;
      email1=email2;
      email2=backupemail;
    });
  }

  late int _currentIndex = 0;
  final tabs = [
    const komputer.Komputer(),
    const laptop.Laptop(),
    // phone.Mobile(),
    // radio.Radio(),
    // sound.Sound(),
    list.List(),
    input.Tulisan(),
  ];

  @override
  void initState() {
    controller = TabController(vsync: this, length: 5);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text("Menu Sidebar", style: TextStyle(color: Colors.white)),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(nama1),
              accountEmail: Text(email1),
              currentAccountPicture: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context)=>detail.Imenu(nama: nama1, gambar: gambar1,))
                  );
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(gambar1),
                ),
              ),
              decoration: const BoxDecoration(
                  image: DecorationImage(image: NetworkImage("https://assets.pikiran-rakyat.com/crop/0x0:0x0/750x500/photo/2021/06/15/4211783752.jpg"),
                      fit: BoxFit.cover
                  )
              ),
              otherAccountsPictures: [
                GestureDetector(
                    onTap: ()=> changeuser(),
                    child: CircleAvatar(backgroundImage: NetworkImage(gambar2),backgroundColor: Colors.white,)
                )
              ],
            ),
            const ListTile(
              title: Text("Setting"),
              trailing: Icon(Icons.settings_outlined),
            ),
            ListTile(
              title: const Text("Add Formulir"),
              trailing: const Icon(Icons.add_circle_outline),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context)=>const formulir.Formulir())
                );
              },
            ),
            ListTile(
              title: const Text("Login"),
              trailing: const Icon(Icons.login_outlined),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context)=>const login.Login())
                );
              },
            ),
            ListTile(
              title: const Text("Login Google"),
              trailing: const FaIcon(FontAwesomeIcons.google, size: 19,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context)=>signin.LoginPage())
                );
              },
            ),
            ListTile(
              title: const Text("Firebase CRUD"),
              trailing: const FaIcon(FontAwesomeIcons.listAlt, size: 19,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context)=>crud.Crud())
                );
              },
            ),
            ListTile(
              title: const Text("Close"),
              trailing: const Icon(Icons.close),
              onTap: (){
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.donut_large_outlined), label: "Status",backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.call_outlined), label: "Calls",backgroundColor: Colors.blue),
          // BottomNavigationBarItem(icon: Icon(Icons.camera_alt_outlined), label: "Camera",backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: "List",backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.text_fields_outlined), label: "Input",backgroundColor: Colors.blue),
        ],
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

