// discover_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tinder_discover/presentation/discover_notifier.dart';
import 'package:tinder_discover/presentation/widgets/cards_stack.dart';
import 'package:tinder_discover/shared/di.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final discoverNotifier = DiscoverNotifier(get());

  @override
  void initState() {
    super.initState();
    discoverNotifier.discoverProfiles();
  }

  @override
  void dispose() {
    discoverNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.black,
              title: const Text(
                "Discover",
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
              elevation: 0,
              leading: SvgPicture.asset(
                'assets/icons/ic_branding.svg',
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListenableBuilder(
                listenable: discoverNotifier,
                builder: (context, child) {
                  if (discoverNotifier.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CardStack(profiles: discoverNotifier.profiles);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
