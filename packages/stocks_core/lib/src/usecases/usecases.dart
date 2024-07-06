import 'package:stocks_core/core.dart';

abstract class UseCase<Output, Command> {
  const UseCase();

  Future<Either<Failure, Output>> execute(Command command);
}

abstract class NoCommandUseCase<Output> {
  const NoCommandUseCase();

  Future<Either<Failure, Output>> execute();
}
