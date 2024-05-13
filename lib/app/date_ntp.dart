import 'package:ntp/ntp.dart';

abstract class DateNTP {
  Future<DateTime> getNow();
}

class DateNTPImpl extends DateNTP {
  @override
  Future<DateTime> getNow() async {
    try {
      return await NTP.now();
    } catch (e) {
      return DateTime.now();
    }
  }
}
