import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';

abstract class BaseUseCase<INPUT, OUTPUT> {
  Future<Either<Failure, OUTPUT>> call(INPUT input);
}
