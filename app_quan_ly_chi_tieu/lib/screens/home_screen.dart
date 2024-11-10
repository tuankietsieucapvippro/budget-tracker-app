import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLogoutLoading = false;

  logOut() async {
    setState(() {
      isLogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => LoginView()
        )
    );
    setState(() {
      isLogoutLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Hello,", style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
              onPressed: (){
                logOut();
              },
              icon: isLogoutLoading
                  ? CircularProgressIndicator()
                  : Icon(Icons.exit_to_app, color: Colors.white,))
        ],
      ),
      body: Container(
        width: double.infinity,
          color: Colors.blue,
          child: Column(
            children: [
              HeroCard(),
            ],
          )),
    );
  }
}

class HeroCard extends StatelessWidget {
  const HeroCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total Balance", style: TextStyle(fontSize: 18, color: Colors.white, height:1.2, fontWeight: FontWeight.w600 ),
            ),
            Text("582000 vnd", style: TextStyle(fontSize: 44, color: Colors.white, height:1.2, fontWeight: FontWeight.w600 ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
            ),
            color: Colors.white,
          ),
          child: Row(
            children: [
              CardOne(color: Colors.green,),
              SizedBox(width: 10,),
              CardOne(color: Colors.red,)
            ],
          ),
        )
      ],
    );
  }
}

class CardOne extends StatelessWidget {
  const CardOne({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)
        ),
        color: color.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Credit", style: TextStyle(color: color, fontSize: 14),),
                  Text("5850 vnd", style: TextStyle(color: color, fontSize: 30),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
