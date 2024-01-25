import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/widgets.dart';

class JumpEffect extends MoveByEffect {
  JumpEffect(Vector2 offset)
      : super(
          offset,
          EffectController(
            duration: 0.4,
            curve: Curves.fastEaseInToSlowEaseOut,
            alternate: true,
          ),
        );
}
