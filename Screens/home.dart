// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:bmi_calculator/widgets/leftbar.dart';
import 'package:bmi_calculator/widgets/rightbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _heightController = TextEditingController();

  final _weightController = TextEditingController();

  double _bmiResult = 0;

  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.yellow),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 30),
              SingleChildScrollView(
                child: Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    keyboardType: const TextInputType.numberWithOptions(),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'HEIGHT',
                      hintStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 70),
              SingleChildScrollView(
                child: Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    keyboardType: const TextInputType.numberWithOptions(),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'WEIGHT',
                      hintStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              double _w = double.parse(_weightController.text);
              double _h = double.parse(_heightController.text);
              setState(
                () {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = 'You Have Normal Weight';
                  } else if (_bmiResult > 25) {
                    _textResult = 'You Are Over Weight';
                  } else if (_bmiResult < 18.5) {
                    _textResult = 'You Are Under Weight';
                  }
                },
              );
            },
            child: Container(
              child: const Text(
                'Calculate',
                style: TextStyle(color: Colors.white60, fontSize: 30),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            child: Text(
              _bmiResult.toStringAsFixed(2),
              style: const TextStyle(color: Colors.yellow, fontSize: 50),
            ),
          ),
          const SizedBox(height: 20),
          Visibility(
            visible: _textResult.isNotEmpty,
            child: Container(
              child: Text(
                _textResult,
                style: const TextStyle(color: Colors.yellow, fontSize: 30),
              ),
            ),
          ),
          Expanded(
            child: Leftbar(barwidth: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Leftbar(barwidth: 40),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Leftbar(barwidth: 60),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Rightbar(barwidth: 40),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Rightbar(barwidth: 70),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Rightbar(barwidth: 90),
          ),
        ],
      ),
    );
  }
}
