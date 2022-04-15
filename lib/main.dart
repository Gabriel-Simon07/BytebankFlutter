import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Column(
          children: [
            Image.asset('images/bytebank_logo.png'),
            Container(
              color: Colors.green,
              height: 120,
              width: 100,
              child: Column(
                children: [
                  Icon(Icons.people),
                  Text('Contacts')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
