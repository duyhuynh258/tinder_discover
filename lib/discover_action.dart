import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum DiscoverAction {
  nope,
  like,
  superLike,
}

class DiscoverActionButton extends StatelessWidget {
  const DiscoverActionButton({super.key, required this.action});
  final bool isHovered = true;
  final DiscoverAction action;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: isHovered ? 1.3 : 1.0,
      child: SvgPicture.asset(
        isHovered ? iconFilledPath : iconPath,
        height: 50,
        width: 50,
      ),
    );
  }

  String get iconPath {
    switch (action) {
      case DiscoverAction.nope:
        return 'assets/icons/ic_dislike.svg';
      case DiscoverAction.like:
        return 'assets/icons/ic_like.svg';
      case DiscoverAction.superLike:
        return 'assets/icons/ic_super_like.svg';
    }
  }

  String get iconFilledPath {
    switch (action) {
      case DiscoverAction.nope:
        return 'assets/icons/ic_dislike_filled.svg';
      case DiscoverAction.like:
        return 'assets/icons/ic_like_filled.svg';
      case DiscoverAction.superLike:
        return 'assets/icons/ic_super_like_filled.svg';
    }
  }
}

class DiscoverActionStack extends StatelessWidget {
  const DiscoverActionStack({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DiscoverActionButton(action: DiscoverAction.nope),
        DiscoverActionButton(action: DiscoverAction.superLike),
        DiscoverActionButton(action: DiscoverAction.like),
      ],
    );
  }
}
