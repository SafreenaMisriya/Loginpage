import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task4/screens/SplashScreen.dart';
import 'package:task4/screens/homepage.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  // passsword and username
  final username = "safreena";
  final password = "lazu12";

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Center(
            child: Text(
          "LOGIN PAGE",
          
        )),
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextFormField(
                style: const TextStyle(
                    color: Colors.blue),
                decoration: const InputDecoration(
                  labelText: "Enter User Name",
                  labelStyle: TextStyle(
                      color: Colors.blue),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  border: OutlineInputBorder(
                       borderSide:
                         BorderSide(color: Colors.transparent, width: 0.0),
                       borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                validator: (value) {
                  if (value == username) {
                    return null;
                  } else if (value == "") {
                    return "please enter correct username";
                  } else {
                    return "username doesnt exist";
                  }
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: TextFormField(
                style: const TextStyle(
                    color: Colors.blue),
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Enter Password",
                  
                  labelStyle: TextStyle(
                      color: Colors.blue),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                    border: OutlineInputBorder(
                       borderSide:
                          BorderSide(color: Colors.blue, width: 0.0),
                       borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                validator: (value) {
                  if (value == password) {
                    return null;
                  } else if (value == "") {
                    return "please enter correct password";
                  } else {
                    return "incorrect password";
                  }
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                /*if form is filled in correct manner, it will give true value to 
                  sharedpreference key (loggedIn) and will take to homepage*/
                if (_formKey.currentState!.validate()) {
                  final sharedpre = await SharedPreferences.getInstance();
                  sharedpre.setBool(loggedIn, true);

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const Homepage()));
                } else {
                  return;
                }
              },
              icon: const Icon(Icons.login),
              label: const Text("LOGIN"),
              style: ElevatedButton.styleFrom(minimumSize: const Size(100, 50)),
            )
          ],
        ),
      )),
    );
  }
}
