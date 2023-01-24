import 'dart:math';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  bool isMale = true;
  double height = 120;
  int age = 12;
  double weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 20,
        elevation: 0.0,
        title: Text(
          "BMI Calculator",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      bottomNavigationBar: ConvexAppBar.badge(
        const <int, dynamic>{3: '99+'},
        items: <TabItem>[
          TabItem(
            icon: Icons.search,
          )
        ],
        onTap: (_) {
          bottomSheet();
        },backgroundColor: Colors.purple,

      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: !isMale ? 2.0 : 3.0,
                              color: isMale ? Colors.black : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Mars_symbol.svg/330px-Mars_symbol.svg.png",
                                    scale: 2.7)),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "MALE",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 25.0),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: isMale ? 2.0 : 3.0,
                            color: isMale ? Colors.grey : Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Venus_symbol.svg/1200px-Venus_symbol.svg.png",
                                    scale: 10)),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "FEMALE",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${height.round()}",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 25.0,
                          ),
                        ),
                        Text(
                          "cm",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25.0,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                        inactiveColor: Colors.grey,
                        activeColor: Colors.black,
                        value: height,
                        min: 80,
                        max: 220,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        }),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 17.0,
                            ),
                            Text(
                              "WEIGHT",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                            ),
                            Text(
                              "${weight.round()}",
                              style: TextStyle(
                                  fontSize: 40.0, fontWeight: FontWeight.w900),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: Colors.black,
                                  heroTag: " weight--",
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  child: Icon(
                                    Icons.minimize,
                                    size: 25,
                                  ),
                                  mini: true,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                FloatingActionButton(
                                  backgroundColor: Colors.black,
                                  heroTag: " weight++",
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                  ),
                                  mini: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 17.0,
                            ),
                            Text(
                              "AGE",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                            ),
                            Text(
                              "${age}",
                              style: TextStyle(
                                  fontSize: 40.0, fontWeight: FontWeight.w900),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: Colors.black,
                                  heroTag: " age--",
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  child: Icon(Icons.minimize_sharp),
                                  mini: true,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                FloatingActionButton(
                                  backgroundColor: Colors.black,
                                  heroTag: " age++",
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: Icon(Icons.add),
                                  mini: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 15.0,
          ),
          /*   Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
              onPressed: () {
                double result = weight / pow(height / 100, 2);
                print(result.round());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => bmiResult(
                      isMale: isMale,
                      age: age,
                      result: result.round(),
                    ),
                  ),
                );
              },
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),*/
        ],
      ),
    );
  }

  Future bottomSheet() {
    double result = weight / pow(height / 100, 2);
    print(result.round());
    return showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.purple,
      builder: (context) => Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        height: 420,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 70.0,
              ),
              Center(
                  child: Text(
                'Your BMI is',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 25),
              )),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Result :   ${result.round()} Kg/m2",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  (result.round() < 19)
                      ? "(under weight)"
                      : (19 <= result.round() && result.round() < 25)
                      ?
                  " (normal weight)"
                      : (25 <= result.round() && result.round() < 30)
                      ?

                  "(over weight)"
                      : (30<= result.round())
                      ? "(obese weight)"
                      : '',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    (result.round() < 19)
                        ? "A BMI of below 18.5 – you're in the underweight range"
                        : (19 <= result.round() && result.round() < 25)
                            ?
                      "A BMI of between 18.5 and 24.9 – you're in the healthy weight range"
                            : (25 <= result.round() && result.round() < 30)
                                ?

                      "A BMI of between 25 and 29.9 – you're in the overweight range."
                                : (30<= result.round())
                                    ? "A BMI of between 30 and 39.9 – you're in the obese range. "
                                    : '',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
