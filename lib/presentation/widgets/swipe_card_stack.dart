import 'package:flutter/material.dart';
import 'package:tinder_discover/domain/profile.dart';
import 'package:tinder_discover/presentation/widgets/card_action.dart';
import 'package:tinder_discover/presentation/widgets/swipe_card.dart';

class SwipeCardStack extends StatefulWidget {
  const SwipeCardStack({super.key, required this.profiles});
  final List<Profile> profiles;

  @override
  State<SwipeCardStack> createState() => _SwipeCardStackState();
}

class _SwipeCardStackState extends State<SwipeCardStack> {
  List<Offset> positions = [];
  List<bool> dismissed = [];

  @override
  void initState() {
    super.initState();
    positions = List.generate(widget.profiles.length, (index) => const Offset(0, 0));
    dismissed = List.generate(widget.profiles.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        for (var i = 0; i < widget.profiles.length; i++)
          Positioned(
            left: positions[i].dx,
            top: positions[i].dy,
            child: SwipeCard(
              profile: widget.profiles[i],
              dismissed: dismissed[i],
              onSwipeUpdate: (details) => _swipeCard(i, details),
              onSwipeEnd: (details) => _endSwipe(i, details),
              position: positions[i],
            ),
          ),
        const Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: CardActions(),
        ),
      ],
    );
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
}
