import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Result extends StatefulWidget {
  double? result;
  String? comment;
  Result({this.result, this.comment});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Weight is: ${widget.result}")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "You are ${widget.comment}",
            style: TextStyle(color: Colors.orange, fontSize: 30),
          ))
        ],
      ),
    );
  }
}
