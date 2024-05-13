import 'error_handler.dart';

class Failure {
  final int code;
  final String message;

  Failure(this.code, this.message);

  factory Failure.fake(String msg) {
    return Failure(ResponseCode.DEFAULT, msg);
  }
}
