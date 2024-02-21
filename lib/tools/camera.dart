import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraTextField extends StatefulWidget {
  @override
  _CameraTextFieldState createState() => _CameraTextFieldState();
}

class _CameraTextFieldState extends State<CameraTextField> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedImage;

  Future<void> _pickImage() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 26),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFfbbc05), width: 3),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFfbbc05),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                      size: 45,
                    ),
                    
                    onPressed: _pickImage,
                  ),
                  Text(
                    'Open Camera',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
        if (_pickedImage != null)
                Text('image or video added!',
          style: TextStyle(color: Colors.green.shade500, fontSize: 10),)
      ],
    );
  }
}
