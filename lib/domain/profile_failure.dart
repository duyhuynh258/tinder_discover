import 'package:tinder_discover/domain/failure.dart';

sealed class ProfileFailure extends Failure {
  const ProfileFailure();
}

class DiscoverProfileFailure extends ProfileFailure {
  final String? message;
  const DiscoverProfileFailure({this.message});
}
