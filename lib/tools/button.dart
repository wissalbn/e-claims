import 'package:flutter/material.dart';
class button extends StatefulWidget {
  final String icon;
  final String text;
  final MaterialPageRoute route;

  const button({
    Key? key,
    required this.icon,
    required this.text,
    required this.route,
  }) : super(key: key);

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 250,
        width: 230,
        child: InkWell(
          onTap: () {
            Navigator.push(context, widget.route); 
          },
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    widget.icon,
                    height: 50,
                    width: 60,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.text,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
