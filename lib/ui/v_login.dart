import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Navigator.pop(context, false),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white)
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal,
        title: Text("Google (Sign" + (user == null ? "Out" : "In")+")"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 80, right: 80),
        child: Center(
          child: Column(
            children: [
              RaisedButton.icon(
                  color: Colors.teal,
                  onPressed: user != null ? null : ()async{
                    await _googleSignIn.signIn();
                    setState(() {

                    });
                  },
                  icon: const FaIcon(FontAwesomeIcons.google, size: 17,),
                  label: const Text("Login Google",style: TextStyle(fontSize: 19),)
              ),
              RaisedButton.icon(
                  onPressed: user == null ? null : ()async{
                    await _googleSignIn.signOut();
                    setState(() {

                    });
                  },
                  color: Colors.teal,
                  icon: const FaIcon(FontAwesomeIcons.signOutAlt, size: 17,),
                  label: const Text("SignOut",style: TextStyle(fontSize: 20),)
              )
            ],
          ),
        ),
      ),
    );
  }
}
