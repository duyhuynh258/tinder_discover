import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum CardAction {
  nope,
  like,
  superLike,
}

class CardActionButton extends StatelessWidget {
  const CardActionButton({super.key, required this.action});
  final bool isHovered = true;
  final CardAction action;

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
      case CardAction.nope:
        return 'assets/icons/ic_dislike.svg';
      case CardAction.like:
        return 'assets/icons/ic_like.svg';
      case CardAction.superLike:
        return 'assets/icons/ic_super_like.svg';
    }
  }

  String get iconFilledPath {
    switch (action) {
      case CardAction.nope:
        return 'assets/icons/ic_dislike_filled.svg';
      case CardAction.like:
        return 'assets/icons/ic_like_filled.svg';
      case CardAction.superLike:
        return 'assets/icons/ic_super_like_filled.svg';
    }
  }
}

class CardActions extends StatelessWidget {
  const CardActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CardActionButton(action: CardAction.nope),
        CardActionButton(action: CardAction.superLike),
        CardActionButton(action: CardAction.like),
      ],
    );
  }
}
