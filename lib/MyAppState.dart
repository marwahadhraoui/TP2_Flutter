import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neonpen/neonpen.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

import 'main.dart';

class MyAppState extends State<MyApp> {
  double _numberFrom = 0;
  String s1 = "";
  String s2 = "";
  String displayName = "";
  @override
  void initState() {
    _numberFrom = 0;
    String s1 = "";
    String s2 = "";
    String displayName = "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var fruits = ['Orange', 'Apple', 'Strawberry', 'Banana'];
    final List<String> _measures = [
      'meters',
      'kilometers',
      'grams',
      'kilograms',
      'feet',
      'miles',
      'pounds (lbs)',
      'ounces',
    ];
    const numberAR = "أربعمائة وخمسون وتسعمائة واثنان وثمانون";
    const numEn = "four hundred fifty point nine hundred eighty two";
    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Measures Converter'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              Neonpen(
                text: Text(
                  'Workshop 2',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                color: Colors.purple,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                opacity: 0.3,
                emphasisWidth: 10,
                emphasisOpacity: 0.3,
                emphasisAngleDegree: 2,
                enableLineZiggle: true,
                lineZiggleLevel: 2,
                isDoubleLayer: false,
              ),
              const SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 3, color: Colors.blue)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 3, color: Colors.green)),
                    hintText: "Type to Print"),
                onChanged: (text) {
                  var x = double.tryParse(text);
                  if (x != null) {
                    setState(() {
                      _numberFrom = x;
                    });
                  }
                },
              ),
              const SizedBox(height: 30),
              Text(_numberFrom.toString()),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    s1 = _numberFrom.toString().split('.')[0];
                    s2 = _numberFrom.toStringAsFixed(2).split('.')[1];
                    displayName = NumberToWordsEnglish.convert(int.parse(s1));
                    displayName += " \$ " +
                        NumberToWordsEnglish.convert(int.parse(s2)) +
                        " Cents";
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple)),
                child: const Text("Convert to English"),
              ),
              Text(displayName),
            ],
          ),
        ),
      ),
    );
  }
}
