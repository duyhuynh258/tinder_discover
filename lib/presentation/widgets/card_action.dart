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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: hoverAction == null || isDislikeHovered,
          child: CardActionButton(
            action: CardAction.dislike,
            isHovered: isDislikeHovered,
          ),
        ),
        Visibility(
          visible: hoverAction == null || isSuperLikeHovered,
          child: CardActionButton(
            action: CardAction.superLike,
            isHovered: isSuperLikeHovered,
          ),
        ),
        Visibility(
          visible: hoverAction == null || isLikeHovered,
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
