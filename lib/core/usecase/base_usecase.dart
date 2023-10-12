import 'package:dartz/dartz.dart';
import 'package:popcorn/core/error/failure.dart';

abstract class UseCase<T> {
  Future<Either<Failure, T>> call();
}
