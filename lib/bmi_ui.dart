import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BmiUi extends StatefulWidget {
  BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  Color colorCard = Color.fromARGB(255, 49, 47, 54);

  bool isMale = true;
  int weight = 50;
  int age = 50;
  double height = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "BMI CALCULATOR",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Card(
                        color: isMale == true
                            ? Color.fromARGB(255, 87, 84, 92)
                            : colorCard,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                size: 45,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(color: Colors.white),
                              )
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Card(
                        color: isMale == false
                            ? Color.fromARGB(255, 87, 84, 92)
                            : colorCard,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                size: 45,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(color: Colors.white),
                              )
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 10,
            child: Card(
              color: colorCard,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "$height",
                        style: TextStyle(fontSize: 45, color: Colors.white),
                      ),
                      Text(
                        "CM",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                    ],
                  ),
                  Slider(
                      thumbColor: Colors.blueAccent,
                      activeColor: Colors.teal,
                      inactiveColor: Colors.grey,
                      min: 100,
                      max: 300,
                      value: height,
                      onChanged: ((value) {
                        setState(() {
                          height = value;
                        });
                      }))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 10,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Weight",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              "$weight",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 45),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  mini: true,
                                  backgroundColor: Colors.white12,
                                  child: Icon(Icons.remove),
                                  onPressed: () {
                                    if (weight > 1) {
                                      setState(() {
                                        weight--;
                                      });
                                    }
                                  },
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                FloatingActionButton(
                                  mini: true,
                                  backgroundColor: Colors.white12,
                                  child: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ]),
                      color: colorCard,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 5,
                    child: Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Age",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              "$age",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 45),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  mini: true,
                                  backgroundColor: Colors.white12,
                                  child: Icon(Icons.remove),
                                  onPressed: () {
                                    if (age > 1) {
                                      setState(() {
                                        age--;
                                      });
                                    }
                                  },
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                FloatingActionButton(
                                  mini: true,
                                  backgroundColor: Colors.white12,
                                  child: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ]),
                      color: colorCard,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: MaterialButton(
              onPressed: () {
                double h = height / 100;
                double heightSq = h * h;
                double result = weight / heightSq;
                String comt;
                // ignore: unrelated_type_equality_checks
                comt = result < 18
                    ? "Under Weight"
                    : result < 24
                        ? "Fit"
                        : "Over Weight";
                print("Result is ${result}");
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Result(
                      result: result,
                      comment: comt,
                    ),
                  ));
                });
              },
              child: Text(
                "CALCULATE",
                style: TextStyle(color: Colors.white54),
              ),
              minWidth: double.infinity,
              color: Color.fromARGB(255, 97, 48, 126),
            ),
          )
        ],
      ),
    );
  }
}
