import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_screen/signupScreen.dart';
import 'homeScreen.dart';

//Controllers
TextEditingController c_email = TextEditingController();
//Variables
bool _isPasswordVisible = false;
bool showErrorEmail = false;
bool showErrorPassword = false;


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
                        errorText: showErrorEmail?c_email.text.isEmpty?'Email cannot be empty':(name.isEmpty)?"Please Sign up your username(email doesn't exist)":'Invalid Email':null,
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
                        errorText: showErrorPassword ?(c_password.text.isEmpty)?'Password cannot be empty': 'Wrong password' : null,
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

//buttons
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if ((c_email.text != '$name@gmail.com') || (c_password.text != password)) {
                            if (c_email.text != '$name@gmail.com') {
                              setState(() {
                                showErrorEmail = true;
                              });
                            } else if (c_password.text != password) {
                              setState(() {
                                showErrorPassword = true;
                              });
                            }
                          } else {
                            setState(() {
                              showErrorEmail = false;
                              showErrorPassword = false;
                              c_email.clear();
                              c_password.clear();
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
                      TextButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SignUpScreen(),
                          ),
                        );
                      }, child:Text('Sign up',style: TextStyle(color: Colors.blueAccent),) )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

