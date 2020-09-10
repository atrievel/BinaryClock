import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './utils.dart';

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  BinaryTimeConverter _now = BinaryTimeConverter();

  // Tick the clock
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {
        _now = BinaryTimeConverter();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Columns for the clock
          ClockColumn(
            binaryInteger: _now.hourTens,
            title: 'H',
            color: Colors.deepPurple,
            rows: 2,
          ),
          ClockColumn(
            binaryInteger: _now.hourOnes,
            title: 'h',
            color: Colors.lightBlue,
          ),
          ClockColumn(
            binaryInteger: _now.minuteTens,
            title: 'M',
            color: Colors.green,
            rows: 3,
          ),
          ClockColumn(
            binaryInteger: _now.minuteOnes,
            title: 'm',
            color: Colors.yellow,
          ),
          ClockColumn(
            binaryInteger: _now.secondTens,
            title: 'S',
            color: Colors.orange,
            rows: 3,
          ),
          ClockColumn(
            binaryInteger: _now.secondOnes,
            title: 's',
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class ClockColumn extends StatelessWidget {
  String binaryInteger;
  String title;
  Color color;
  int rows;
  List bits;

  ClockColumn({this.binaryInteger, this.title, this.color, this.rows = 4}) {
    bits = binaryInteger.split('');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...[
          Container(
            child: Text(
              title,
              style: Theme.of(context).textTheme.display1,
            ),
          )
        ],
        ...bits.asMap().entries.map((entry) {
          int idx = entry.key;
          String bit = entry.value;

          bool isActive = bit == '1';
          int binaryCellValue = pow(2, 3 - idx);

          return AnimatedContainer(
            duration: Duration(milliseconds: 475),
            curve: Curves.ease,
            height: 40,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: isActive
                  ? color
                  : idx < 4 - rows
                      ? Colors.white.withOpacity(0)
                      : Colors.black38,
            ),
            margin: EdgeInsets.all(4),
            child: Center(
              child: isActive
                  ? Text(
                      binaryCellValue.toString(),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.2),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : Container(),
            ),
          );
        }),
        ...[
          Text(
            int.parse(binaryInteger, radix: 2).toString(),
            style: TextStyle(fontSize: 30, color: color),
          ),
          Container(
            child: Text(
              binaryInteger,
              style: TextStyle(fontSize: 15, color: color),
            ),
          )
        ]
      ],
    );
  }
}
