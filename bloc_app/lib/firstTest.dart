import 'package:bloc_app/second_test.dart';
import 'package:flutter/material.dart';

class navRoutScreen extends StatefulWidget {
  const navRoutScreen({Key? key}) : super(key: key);

  @override
  _navRoutScreenState createState() => _navRoutScreenState();
}

class _navRoutScreenState extends State<navRoutScreen> {
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          title: Text('Navigation First Screen'),
        ),
        body: Center(
            child: ElevatedButton(
          child: Text('Change Color'),
          onPressed: () {
            _navigateAndGetColor(context);
          },
        )));
  }

  Future _navigateAndGetColor(BuildContext context) async {
    color = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavigationSecond()),
    );
    setState(() {
      color = color;
    });
  }
}
