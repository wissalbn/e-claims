import 'package:eclaims2/tools/voice.dart';
import 'package:flutter/material.dart';
import 'tools/camera.dart';
import 'tools/liste.dart';
import 'tools/comment.dart';

class AddClaim extends StatefulWidget {
  const AddClaim({super.key});

  @override
  State<AddClaim> createState() => _AddClaimState();
}

class _AddClaimState extends State<AddClaim> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth <= 600) {
                return IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Color(0xFFfbbc05),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                );
              } else {
                return Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Color(0xFFfbbc05),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          actions: [
            Builder(
              builder: (context) => InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Provide details about your claim',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    // key: formkey,
                    child: Column(
                  children: [
                    const Text(
                      'Add images or video',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    CameraTextField(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Add a voice message',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    VoiceTextField(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Add type of complaint',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    liste(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Add a text message',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Comment(),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  // if (formKey.currentState!.validate()) {
                                  //   validation();
                                  // }
                                },
                                child: Text('Continue',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFfbbc05),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
