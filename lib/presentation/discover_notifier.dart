import 'package:flutter/material.dart';
import 'package:tinder_discover/domain/profile.dart';
import 'package:tinder_discover/domain/profile_repository.dart';

class DiscoverNotifier extends ChangeNotifier {
  final ProfileRepository _profileRepository;

  List<Profile> profiles = [];

  bool isLoading = false;

  DiscoverNotifier(this._profileRepository);

  Future<void> discoverProfiles() async {
    isLoading = true;
    final result = await _profileRepository.discoverProfiles();
    isLoading = false;
    result.when(
      success: (profiles) {
        this.profiles = profiles;

        notifyListeners();
      },
      failed: (failure) {
        // Handle failure
        notifyListeners();
      },
    );
  }
}
