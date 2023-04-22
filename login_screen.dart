
import 'package:flutter/material.dart';
import 'package:multi_role/home_screen.dart';
import 'package:multi_role/student_screen.dart';


import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email'
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
            controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password'
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
            controller: ageController,
            keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Age'
              ),
            ),
            const SizedBox(height: 40),

          InkWell(
            onTap: ()async {
             SharedPreferences sp = await SharedPreferences.getInstance();
             sp.setString('email', emailController.text.toString());
             sp.setString('age', ageController.text.toString());
             sp.setString('UserType', 'student');
             sp.setBool('isLogin', true);
             Navigator.push(context,
             MaterialPageRoute(builder: (context) => StudentScreen()));
            },
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.green,
              child: const Center(child: Text("Sign Up"),),
            ),
          )
        ],),
      )
    );
  }
}