import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum CardAction {
  dislike,
  like,
  superLike,
}

class CardActionButton extends StatelessWidget {
  const CardActionButton({
    super.key,
    required this.action,
    required this.isHovered,
  });
  final bool isHovered;
  final CardAction action;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 300),
      scale: isHovered ? 1.3 : 1.0,
      curve: Curves.easeInOut,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: SvgPicture.asset(
          isHovered ? iconFilledPath : iconPath,
          key: ValueKey<String>(isHovered ? iconFilledPath : iconPath),
          height: 60,
          width: 60,
        ),
      ),
    );
  }

  String get iconPath {
    switch (action) {
      case CardAction.dislike:
        return 'assets/icons/ic_dislike.svg';
      case CardAction.like:
        return 'assets/icons/ic_like.svg';
      case CardAction.superLike:
        return 'assets/icons/ic_super_like.svg';
    }
  }

  String get iconFilledPath {
    switch (action) {
      case CardAction.dislike:
        return 'assets/icons/ic_dislike_filled.svg';
      case CardAction.like:
        return 'assets/icons/ic_like_filled.svg';
      case CardAction.superLike:
        return 'assets/icons/ic_super_like_filled.svg';
    }
  }
}

class CardActions extends StatelessWidget {
  const CardActions({super.key, this.hoverAction});

  final CardAction? hoverAction;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 32,
      children: [
        Visibility(
          visible: hoverAction == null || isDislikeHovered,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: CardActionButton(
            action: CardAction.dislike,
            isHovered: isDislikeHovered,
          ),
        ),
        Visibility(
          visible: hoverAction == null || isSuperLikeHovered,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: CardActionButton(
            action: CardAction.superLike,
            isHovered: isSuperLikeHovered,
          ),
        ),
        Visibility(
          visible: hoverAction == null || isLikeHovered,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: CardActionButton(
            action: CardAction.like,
            isHovered: isLikeHovered,
          ),
        ),
      ],
    );
  }

  bool get isDislikeHovered => hoverAction == CardAction.dislike;
  bool get isSuperLikeHovered => hoverAction == CardAction.superLike;
  bool get isLikeHovered => hoverAction == CardAction.like;
}
