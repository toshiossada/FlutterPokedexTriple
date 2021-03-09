import '../../../../shared/helpers/errors.dart';

abstract class FailureLogin implements Failure {}

class FailureGetPokemons implements FailureLogin {
  @override
  final String? message;
  FailureGetPokemons({
    this.message,
  });
}
