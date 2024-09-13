import 'package:flutter/material.dart';
import 'package:tinder_discover/data/profile_data_source.dart';
import 'package:tinder_discover/data/profile_repository_impl.dart';
import 'package:tinder_discover/domain/profile_repository.dart';
import 'package:tinder_discover/presentation/discover_screen.dart';
import 'package:tinder_discover/shared/di.dart';

void main() {
  registerDependency<ProfileDataSource>(ProfileDataSource());
  registerDependency<ProfileRepository>(ProfileRepositoryImpl(get()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinder Discover',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DiscoverScreen(),
    );
  }
}
