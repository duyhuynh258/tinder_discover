import 'package:flutter/material.dart';
import 'package:tinder_discover/domain/profile.dart';
import 'package:tinder_discover/presentation/widgets/card_action.dart';
import 'package:tinder_discover/presentation/widgets/swipe_card.dart';

class CardStack extends StatefulWidget {
  const CardStack({super.key, required this.profiles});
  final List<Profile> profiles;

  @override
  State<CardStack> createState() => _CardStackState();
}

class _CardStackState extends State<CardStack> {
  List<Offset> positions = [];
  List<bool> dismissed = [];

  CardAction? _hoverAction;

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
        Positioned(
          bottom: 90,
          left: 0,
          right: 0,
          child: CardActions(hoverAction: _hoverAction),
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
      _hoverAction = cardHoverAction(positions[index]);
    });
  }

  void _endSwipe(int index, DragEndDetails details) {
    if (_hoverAction != null) {
      setState(() {
        dismissed[index] = true;
        _hoverAction = null;
      });
    } else {
      setState(() {
        positions[index] = const Offset(0, 0);
      });
    }
  }
}
