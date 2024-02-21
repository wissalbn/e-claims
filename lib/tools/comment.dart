import 'package:flutter/material.dart';

class Comment extends StatefulWidget {

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        child: TextFormField(
          controller: commentController,
          maxLines: null,
          
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            // contentPadding: const EdgeInsets.symmetric(vertical: 50),
            hintText: 'Type your text here...',
            hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w600),
            contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 190),
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
          ),
          validator: (value) {
            return value!.isEmpty ? 'Please fill this section' : null;
          },
        ),
      ),
    );
  }
}
