import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/controllers/login_cont.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({Key? key}) : super(key: key);
  final controller = Get.put(LoginController());

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
        title: const Text("SignIn Google"),
      ),
      body: Center(
        child: Obx((){
          if(controller.googleAccount.value==null){
            return buildLoginButton();
          }
          else{
            return buildProfileView();
          }
        }),
      ),
    );
  }

  Column buildProfileView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(controller.googleAccount.value?.photoUrl ?? '').image,
          radius: 100,
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        Text(controller.googleAccount.value?.displayName ?? '',
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(controller.googleAccount.value?.email ?? '',
          style: const TextStyle(fontSize: 20),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        RaisedButton.icon(
            color: Colors.teal,
            icon: const Icon(Icons.logout_outlined),
            label: const Text("Logout"),

            onPressed: (){
              controller.logout();
            }
        )
      ],
    );
  }

  RaisedButton buildLoginButton() {
    return RaisedButton.icon(
        color: Colors.teal,
        icon: const Icon(Icons.login_outlined),
        onPressed: (){
          controller.login();
        },
        label: const Text("Login")
    );
  }
}
