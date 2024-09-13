import 'package:tinder_discover/data/profile_data_source.dart';
import 'package:tinder_discover/domain/profile.dart';
import 'package:tinder_discover/domain/profile_failure.dart';
import 'package:tinder_discover/domain/profile_repository.dart';
import 'package:tinder_discover/domain/result.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _profileDataSource;

  ProfileRepositoryImpl(this._profileDataSource);

  @override
  Future<Result<DiscoverProfileFailure, List<Profile>>> discoverProfiles() async {
    try {
      final profileDTOs = await _profileDataSource.loadProfiles();
      return Success(
        profileDTOs.map((profile) => profile.toDomain()).toList(),
      );
    } catch (e) {
      return Failed(DiscoverProfileFailure(message: e.toString()));
    }
  }
}
