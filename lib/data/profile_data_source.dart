import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tinder_discover/data/profile_dto.dart';

class ProfileDataSource {
  /// Loading from `assets/profiles.json`
  Future<List<ProfileDTO>> loadProfiles() async {
    // Load the JSON file from the assets folder
    final String jsonString = await rootBundle.loadString('assets/profiles.json');
    // Decode the JSON string into a list of maps
    final List<Map<String, dynamic>> jsonList =
        (json.decode(jsonString) as List).map((e) => Map<String, dynamic>.from(e)).toList();
    // Convert the list of maps into a list of ProfileDTO objects
    return jsonList.map((json) => ProfileDTO.fromJson(json)).toList();
  }
}
