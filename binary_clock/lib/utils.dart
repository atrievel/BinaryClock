import 'package:intl/intl.dart';

class BinaryTimeConverter {
  List<String> binaryInts;

  // get each digit of the binary string
  get hoursTen => binaryInts[0];
  get hoursOne => binaryInts[1];
  get minutesTen => binaryInts[2];
  get minutesOne => binaryInts[3];
  get secondsTen => binaryInts[4];
  get secondsOne => binaryInts[5];

  BinaryTimeConverter() {
    DateTime now = DateTime.now();

    // convert current time to a list of binary strings
    // pad left with 0s if the digit doesn't exist
    binaryInts = DateFormat('Hms')
        .format(now)
        .replaceAll(':', '')
        .split('')
        .map((s) => int.parse(s).toRadixString(2).padLeft(4, '0'))
        .toList();
  }
}
