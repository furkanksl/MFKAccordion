import 'package:my_accordion/model/my-accordion-model.dart';
import 'package:flutter/material.dart';
import 'package:my_accordion/my_accordion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Define a list which is has to include text , content and a bool value
  List<MyAccordionModel> list = [
    MyAccordionModel(
      'First',
      'FirstContent',
      false,
    ),
    MyAccordionModel(
      'Second',
      'SecondContent',
      false,
    ),
    MyAccordionModel(
      'Third',
      'ThirdContent',
      false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MFKAccordion Demo'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: MyAccordion(
          list,
          /* collapsedIcon: Icons.add,
          expandenIcon: Icons.remove, */
        ),
      ),
    );
  }
}
