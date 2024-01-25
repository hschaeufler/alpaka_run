import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/widgets.dart';

class JumpEffect extends MoveByEffect {
  JumpEffect(
    Vector2 offset, {
    VoidCallback? onMax,
  }) : super(
          offset,
          EffectController(
            duration: 0.7,
            curve: Curves.easeOutCirc,
            alternate: true,
            onMax: onMax,
          ),
        );
}
