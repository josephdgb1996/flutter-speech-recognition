import 'package:flutter/material.dart';
import 'package:permission/permission.dart';
import 'package:speech_recognition/speech_recognition.dart';

class SpeechRecognitionScreen extends StatefulWidget {
  const SpeechRecognitionScreen({Key key}) : super(key: key);

  @override
  _SpeechRecognitionScreenState createState() => _SpeechRecognitionScreenState();
}

class _SpeechRecognitionScreenState extends State<SpeechRecognitionScreen> {

  SpeechRecognition speech = SpeechRecognition();
  bool isAvailable = false;
  bool isListening = false;

  String currentLocale = "";
  String transcription = "";

  @override
  void initState(){
    super.initState();

    requestMicPermission();
    initSpeechRecognizer();
  }

  void requestMicPermission() async {
     await Permission.requestPermissions([PermissionName.Microphone]);
  }

  void initSpeechRecognizer() {
    speech.setAvailabilityHandler(
        (bool result) => setState(() => isAvailable = result));

    speech.setCurrentLocaleHandler(
        (String locale) => setState(() => currentLocale = locale));

    speech
        .setRecognitionStartedHandler(() => setState(() => isListening = true));

    speech.setRecognitionResultHandler(
        (String text) => setState(() => transcription = text));

    speech.setRecognitionCompleteHandler(
        () => setState(() => isListening = false));

    speech.activate().then((res) => setState(() => isAvailable = res));
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.green,
      body: bodyWidget(),
    ));
  }

  Widget bodyWidget() {
    Widget buttonActions = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.settings_voice,
              color: Colors.black,
            ),
            onPressed: () {
              speech
                  .listen(locale: "es_ES")
                  .then((result) => setState(() => print('result : $result')));
            },
          ),
        ),
      ]
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buttonActions,
        Container(
            child: Text(
          transcription,
          style: TextStyle(color: Colors.white),
        )),
        Text('locale:'+' '+'$currentLocale')
      ],
    );
  }
}
