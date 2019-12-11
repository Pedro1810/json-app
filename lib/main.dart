import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'student.dart';
import 'dart:convert'; // Из строки в раскодированный словарь

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp()
  )
);

class MyApp extends StatefulWidget {
  final url = 'https://raw.githubusercontent.com/PoojaB26/ParsingJSON-Flutter/master/assets/student.json';

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String _url;
  String _appBarTitle = 'JSON Request';
  Student _student = Student(id: '', name: '', scores: null);

  @override
  void initState() {
    _url = widget.url;
    super.initState();
    _sendRequest();
  }

    _sendRequest() {
      _appBarTitle = _url;

      http.get(_url).then((response) {
        final parsedJson = json.decode(response.body);
        _student = Student.fromJson(parsedJson);
        setState(() {});
      }).catchError((error) {
        _appBarTitle = error.toString();
        setState(() {});
      });

      setState(() {});
    }

  @override
  Widget build(BuildContext context) {
      _sendRequest();

    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "ID: " + (_student.id == null ? '' : _student.id),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              "Name: " + (_student.name == null ? '' : _student.name),
              style: TextStyle(fontSize: 20
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Scores: " + (_student.scores == null ? '' : _student.scores.toString()),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}