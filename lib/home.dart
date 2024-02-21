import 'package:eclaims2/addclaim.dart';
import 'package:eclaims2/history.dart';
import 'package:eclaims2/map.dart';
import 'package:eclaims2/news.dart';
import 'package:flutter/material.dart';
import 'tools/button.dart'; 
class home extends StatefulWidget {
  const home({super.key});
 
  @override
  State<home> createState() => _homeState();
}
 
class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 60,
            ),
            const Text('Hi', style: TextStyle(fontSize: 25)),
            const Text(
              'Mohammed',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('What are you sending today ?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(
              height: 100,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.amber,
                      height: 150,
                      width: 150,
                      child: button(
                          icon: 'images/claimicon.png', text: "Add Claim",
                          route: MaterialPageRoute(builder: (context) => const  AddClaim())),
                    ),
                    Container(
                      color: Colors.amber,
                      height: 150,
                      width: 150,
                      child:button(
                          icon: 'images/historyicon.png', text: "History", route: MaterialPageRoute(builder: (context) => const History())),
                    ),
                  ],
                ),const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.amber,
                      height: 150,
                      width: 150,
                      child: button(
                          icon: 'images/mapicon.png', text: "Map",
                          route: MaterialPageRoute(builder: (context) => const map())),
                    ),
                    Container(
                      color: Colors.amber,
                      height: 150,
                      width: 150,
                      child: button(
                          icon: 'images/newsicon.png', text: "News",
                          route: MaterialPageRoute(builder: (context) => const News())),
                    ),
                  ],
                ),
              ],
            )
          ]),
        ),
      ),
    ));
  }
}
 
