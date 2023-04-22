import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:multi_role/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String email = '', age = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

loadData()async{
  SharedPreferences sp = await SharedPreferences.getInstance();
  email = sp.getString('email') ?? '';
  age = sp.getString('age') ?? '';
  setState(() {
    
  });

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Email'),
                  Text(email.toString()),
                ],
              ),
              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Age'),
                  Text(age.toString()),
                ],
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();

                  sp.clear();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.green,
                  child: const Center(
                    child: Text("Log Out"),
                  ),
                ),
              )
            ]),
      ),
    );
    ;
  }
}
