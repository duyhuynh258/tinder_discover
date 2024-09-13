// swipe_card.dart
import 'package:flutter/material.dart';
import 'package:tinder_discover/domain/profile.dart';

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
    return GestureDetector(
      onPanUpdate: onSwipeUpdate,
      onPanEnd: onSwipeEnd,
      child: Transform.rotate(
        angle: -position.dx / screenWidth * 0.2,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
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
              padding: const EdgeInsets.all(16.0),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
