import 'package:intl/intl.dart';

class BinaryTimeConverter {
  List<String> binaryIntegers;

  get hourTens => binaryIntegers[0];
  get hourOnes => binaryIntegers[1];
  get minuteTens => binaryIntegers[2];
  get minuteOnes => binaryIntegers[3];
  get secondTens => binaryIntegers[4];
  get secondOnes => binaryIntegers[5];

  BinaryTimeConverter() {
    DateTime now = DateTime.now();

    // convert current time to a list of binary strings
    // pad left with 0s if the digit doesn't exist
    binaryIntegers = DateFormat('Hms')
        .format(now)
        .replaceAll(':', '')
        .split('')
        .map((s) => int.parse(s).toRadixString(2).padLeft(4, '0'))
        .toList();
  }
}
