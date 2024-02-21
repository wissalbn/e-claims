import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String hintText;
  final bool showSuffixIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const Input({
    Key? key,
    required this.hintText,
    required this.showSuffixIcon,
    required this.controller,
    required this.keyboardType,
  }) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  late bool showPassword;

  @override
  void initState() {
    super.initState();
    showPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        child: TextFormField(
          obscureText: showPassword,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey.shade700),
            filled: true,
            fillColor: Colors.grey.shade200,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFfbbc05)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFfbbc05),
              ),
            ),
            suffixIcon: widget.showSuffixIcon
                ? InkWell(
                    onTap: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      child: Icon(
                        showPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : null,
          ),
          validator: (value) {
            return value!.isEmpty ? 'Please fill this section' : null;
          },
        ),
      ),
    );
  }
}
