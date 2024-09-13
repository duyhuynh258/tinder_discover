import 'package:tinder_discover/domain/profile.dart';
import 'package:tinder_discover/domain/profile_failure.dart';
import 'package:tinder_discover/domain/result.dart';

abstract class ProfileRepository {
  Future<Result<DiscoverProfileFailure, List<Profile>>> discoverProfiles();
}
