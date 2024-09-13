// swipe_card.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tinder_discover/domain/profile.dart';
import 'package:tinder_discover/presentation/widgets/card_action.dart';
import 'package:tinder_discover/presentation/widgets/card_action_stamp.dart';

class SwipeCard extends StatelessWidget {
  final Profile profile;
  final bool dismissed;
  final Offset position;
  final Function(DragUpdateDetails) onSwipeUpdate;
  final Function(DragEndDetails) onSwipeEnd;

  const SwipeCard({
    super.key,
    required this.profile,
    required this.dismissed,
    required this.onSwipeUpdate,
    required this.onSwipeEnd,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    if (dismissed) return Container();
    final screenWidth = MediaQuery.of(context).size.width;
    const padding = 16.0;
    // Ensure Positioned is only used inside a Stack
    final hoverAction = cardHoverAction(position);
    return GestureDetector(
      onPanUpdate: onSwipeUpdate,
      onPanEnd: onSwipeEnd,
      child: Transform.rotate(
        angle: -position.dx / screenWidth * 0.4,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 500,
                width: screenWidth - padding,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(profile.imageUrl),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.name,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${profile.distanceKm} km', // Add dynamic profession based on data
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 72,
                      )
                    ],
                  ),
                ),
              ),
              if (hoverAction != null)
                Positioned(
                  top: 40,
                  child: CardActionStamp(
                    action: hoverAction,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

CardAction? cardHoverAction(Offset position) {
  log('Position: $position');

  if (position.dx < -50) {
    return CardAction.dislike;
  }
  if (position.dx > 50) {
    return CardAction.like;
  }

  if (position.dy < -50) {
    return CardAction.superLike;
  }
  return null;
}
