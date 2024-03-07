import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_screen/loginScreen.dart';

//controller
TextEditingController c_name = TextEditingController();
TextEditingController c_password = TextEditingController();
//variables
bool showErrorPassword = false;
bool showErrorUsername = false;
bool _isPasswordVisible = false;
String name='';
String password='';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Sign Up Screen'),
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
                    child: Column(
                      children: [
                        Text('SignUp\n', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                        Text('Enter Your username and Password', style: TextStyle(fontSize: 15)),
                      ],
                    ),
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

//Password Field
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  TextField(
                      onChanged: (_) {
                        setState(() {
                          showErrorPassword=false;
                         password=c_password.text;
                        });
                      },
                      obscureText: !_isPasswordVisible,
                      controller: c_password,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        errorText: showErrorPassword?'Password cannot be empty':null,
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
                  ElevatedButton(
                    onPressed: () {
                      if(name.isEmpty||password.isEmpty){
                      if(password.isEmpty){
                        setState(() {
                          showErrorPassword=true;
                        });
                      }
                        if(name.isEmpty){
                        setState(() {
                          showErrorUsername=true;
                        });
                      }
                      }
                      else{
                      setState(() {
                        c_password.clear();
                        showErrorPassword=false;
                        });
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoginScreen(),
                          ),
                        );}
                      }, child: Text("Login"),
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
