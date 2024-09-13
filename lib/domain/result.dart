import 'package:tinder_discover/domain/failure.dart';

class VoidSuccess<F extends Failure> extends Success<F, void> {
  const VoidSuccess() : super(null);
}

class Success<F extends Failure, S> extends Result<F, S> {
  const Success(this.data);
  @override
  final S data;
}

class Failed<F extends Failure, S> extends Result<F, S> {
  const Failed(this.failure);
  final F failure;
}

sealed class Result<F extends Failure, S> {
  const Result();
  bool get isSuccess => this is Success<F, S>;
  bool get isFailure => this is Failed<F, S>;

  C when<C>({
    required C Function(S data) success,
    required C Function(F failure) failed,
  }) {
    return switch (this) {
      Success<F, S>() => success((this as Success<F, S>).data),
      Failed<F, S>() => failed((this as Failed<F, S>).failure)
    };
  }

  S? get data {
    if (this is Success<F, S>) {
      return (this as Success<F, S>).data;
    }
    return null;
  }
}
