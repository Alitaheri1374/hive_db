import 'package:flutter/material.dart';
import 'package:test_hive/widget/show_data.dart';
import 'package:test_hive/widget/add.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AddWidget(
               afterAdd: (){
                  setState(() {});
               },
            ),
            ShowDataWidget()

          ],
        ),
      ),
    );
  }
}
