import 'package:flutter/material.dart';
import 'package:tinder_discover/presentation/widgets/card_action.dart';

class CardActionStamp extends StatelessWidget {
  final CardAction action;
  const CardActionStamp({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color,
          width: 4,
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color get color {
    switch (action) {
      case CardAction.dislike:
        return const Color((0xFFF75555));
      case CardAction.like:
        return const Color((0xFF9610FF));
      case CardAction.superLike:
        return const Color((0xFFFF981F));
    }
  }

  String get text {
    switch (action) {
      case CardAction.dislike:
        return "Nope!";
      case CardAction.like:
        return "Like!";
      case CardAction.superLike:
        return "Super Like!";
    }
  }
}
