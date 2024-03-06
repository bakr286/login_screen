import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homeScreen.dart';

//Controllers
TextEditingController c_email = TextEditingController();
TextEditingController c_password = TextEditingController();
TextEditingController c_name = TextEditingController();
//Variables
bool _isDarkTheme=false;
bool _isPasswordVisible = false;
bool showErrorEmail = false;
bool showErrorPassword = false;
bool showErrorUsername = false;
String name='';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Login Screen'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
//Username field
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s')),],
                      decoration: InputDecoration(
                          errorText: showErrorUsername?'Username cannot be empty':null,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          labelText: 'Username',
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Enter your name'
                      ),
                      controller: c_name,
                      onChanged: (_){
                        setState(() {
                          showErrorUsername =false;
                          name=c_name.text;

                        });
                      },
                    ),
                  ),
//Email field
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s')),],
                      onChanged: (_){
                        setState(() {
                          showErrorEmail=false;
                        });
                      },
                      controller:c_email ,
                      decoration: InputDecoration(
                        errorText: showErrorEmail?'Invalid Email':null,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(Icons.email),
                        labelText:'E-mail' ,
                        hintText: 'Username@gmail.com',
                      ),

                    ),
                  ),
//Password Field
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  TextField(
                      onChanged: (_) {
                        setState(() {
                          showErrorPassword = false;
                        });
                      },
                      obscureText: !_isPasswordVisible,
                      controller: c_password,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        errorText: showErrorPassword ? 'Wrong password' : null,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(Icons.password),
                        labelText: 'Password',
                        hintText: 'Enter your Password',
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

// Login button
                  ElevatedButton(
                    onPressed: () {
                      (c_name.text.isEmpty) ? showErrorUsername = true : null;
                      if ((c_email.text != '$name@gmail.com') || (c_password.text != '12345')) {
                        if (c_email.text != '$name@gmail.com') {
                          setState(() {
                            showErrorEmail = true;
                          });
                        } else if (c_password.text != '12345') {
                          setState(() {
                            showErrorPassword = true;
                          });
                        }
                      } else {
                        setState(() {
                          showErrorUsername = false;
                          showErrorEmail = false;
                          showErrorPassword = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HomeScreen(),
                          ),
                        );
                      }
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () {
            setState(() {
              _isDarkTheme = !_isDarkTheme; // Toggle theme
            });
            print(_isDarkTheme);
          },
          child: Icon(_isDarkTheme ? CupertinoIcons.moon_fill : CupertinoIcons.sun_max_fill),
        ),
      ),
    );
  }
}
