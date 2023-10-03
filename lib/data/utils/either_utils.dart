import 'package:dartz/dartz.dart';

class EitherUtils {
  static Either<A, List<B>> sequence<A, B>(List<Either<A, B>> response) {
    List<B> list = [];
    for (var result in response) {
      final data = result.fold((l) {
        return Left(l);
      }, (r) {
        list.add(r);
      });
      if (data?.isLeft() ?? false) {
        return data! as Left<A, List<B>>;
      }
    }
    return Right(list);
  }
}
