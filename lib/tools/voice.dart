import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceTextField extends StatefulWidget {
  @override
  _VoiceTextFieldState createState() => _VoiceTextFieldState();
}

class _VoiceTextFieldState extends State<VoiceTextField> {
  String statusText = "";
  bool isComplete = false;
  bool isRecording = false;
  bool isPlaying = false;
  late RecordMp3 recorder;
  Duration recordingDuration = Duration.zero;
  Timer? timer;
  bool isTimerActive = false;

  @override
  void initState() {
    super.initState();
    recorder = RecordMp3.instance;
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
                      isRecording ? Icons.stop : Icons.mic,
                      color: Colors.black,
                      size: 45,
                    ),
                    onPressed: () async {
                      if (!isRecording) {
                        startRecord();
                      } else {
                        stopRecord();
                      }
                      setState(() {
                        isRecording = !isRecording;
                      });
                    },
                  ),
                  if (isRecording)
                    const Text(
                      '',
                      
                    )
                  else
                    const Text(
                      'Open Mic',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ), textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
            Positioned(
              left: 10,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(isRecording)
                    Text(
                      isTimerActive
                          ? '${recordingDuration.inMinutes}:${recordingDuration.inSeconds.remainder(60).toString().padLeft(2, '0')}'
                          : '',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    )
                ],
            )),
            Positioned(
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (!isRecording && recordFilePath != null && File(recordFilePath!).existsSync())
                    IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () async {

                          play();
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        
                      },
                    ),
                ],
              ),
            )
          ],
        ),
        if (!isRecording && recordFilePath != null && File(recordFilePath!).existsSync())
          Text('voice message added!',
          style: TextStyle(color: Colors.green.shade500, fontSize: 10),
          ),
      ],
    );
  }

  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  DateTime? startTime;
  void startRecord() async {
    bool hasPermission = await checkPermission();
    isRecording = true;
    if (hasPermission) {
      statusText = "Recording...";
      recordFilePath = await getFilePath();
      isComplete = false;
      RecordMp3.instance.start(recordFilePath!, (type) {
        statusText = "Record error--->$type";
        setState(() {});
      });
      startTime = DateTime.now();
      isTimerActive = true;
      timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        setState(() {
          recordingDuration = DateTime.now().difference(startTime!);
        });
      });
    } else {
      statusText = "No microphone permission";
    }

    setState(() {});
  }

  void stopRecord() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      isTimerActive = false;
    }
    bool s = RecordMp3.instance.stop();
    if (s) {
      if (startTime != null) {
        Duration recordingDuration = DateTime.now().difference(startTime!);
        int minutes = recordingDuration.inMinutes;
        int seconds = recordingDuration.inSeconds % 60;

        String durationText = '$minutes:${seconds.toString().padLeft(2, '0')}';
        statusText = 'Record complete - Duration: $durationText';
      }

      isComplete = true;
      setState(() {});
    }
  }

  String? recordFilePath;

  void play() {
    if (recordFilePath != null && File(recordFilePath!).existsSync()) {
      AudioPlayer audioPlayer = AudioPlayer();
      audioPlayer.play(
        UrlSource(recordFilePath!),
      );
    }
  }

  int i = 0;

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/test_${i++}.mp3";
  }
}
