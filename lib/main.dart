import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';

void main() => runApp(TToS());

class TToS extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Texto a voz'),
          backgroundColor: Colors.deepOrange,
        ),
        body: _Home(),
      ),
    );
  }
}

class _Home extends StatefulWidget {
  __HomeState createState() => __HomeState();
}

class __HomeState extends State<_Home> {
  final FlutterTts flutterTts = FlutterTts();

  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    _speak(String text) async {
      print(await flutterTts.getLanguages);
      await flutterTts.setLanguage('es-Es');
      await flutterTts.setPitch(1);
      await flutterTts.speak(text);
    }

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Escribe lo que quieras escuchar',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(width: 2, color: Colors.deepOrange))),
              controller: textEditingController,
            ),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(width: 2, color: Colors.deepOrange)),
            child: Text(
              'Presiona el botón para escuchar el texto',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () => _speak(textEditingController.text),
            padding: EdgeInsets.all(20),
            color: Colors.deepOrange,
          ),
        ],
      ),
    );
  }
}
