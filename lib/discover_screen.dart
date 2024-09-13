// discover_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tinder_discover/discover_action.dart';

import 'swipe_card.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List<String> people = ["Leah, 21", "Eva, 21", "Genna, 19", "Leah, 19"];
  List<Offset> positions = [];
  List<bool> dismissed = [];

  @override
  void initState() {
    super.initState();
    positions = List.generate(people.length, (index) => const Offset(0, 0));
    dismissed = List.generate(people.length, (index) => false);
  }

  void _swipeCard(int index, DragUpdateDetails details) {
    setState(() {
      positions[index] = Offset(
        positions[index].dx + details.delta.dx,
        positions[index].dy + details.delta.dy,
      );
    });
  }

  void _endSwipe(int index, DragEndDetails details) {
    const dragThreshold = 100;
    if (positions[index].dx > dragThreshold || positions[index].dx < -dragThreshold) {
      setState(() {
        dismissed[index] = true;
      });
    } else {
      setState(() {
        positions[index] = const Offset(0, 0);
      });
    }
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
              child: Stack(
                clipBehavior: Clip.none,
                children: people.asMap().entries.map((entry) {
                  int index = entry.key;
                  final position = positions[index];
                  return Positioned(
                    left: position.dx,
                    top: position.dy,
                    child: SwipeCard(
                      index: index,
                      dismissed: dismissed[index],
                      onSwipeUpdate: (details) => _swipeCard(index, details),
                      onSwipeEnd: (details) => _endSwipe(index, details),
                      name: people[index],
                      imageIndex: index + 1,
                      position: position,
                    ),
                  );
                }).toList()
                  ..add(
                    Positioned(
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: DiscoverActionStack(),
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
