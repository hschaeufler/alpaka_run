import 'package:alpaka_run/game/alpaka_run_game.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flutter/animation.dart';

class Alpaka extends SpriteAnimationComponent
    with HasGameReference<AlpakaRunGame>, TapCallbacks {
  @override
  Future<void> onLoad() async {
    animation = await game.loadSpriteAnimation(
      'alpaka_spritesheet.png',
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.2,
        textureSize: Vector2.all(1024),
      ),
    );

    position.x = game.size.x / 2;
    position.y = game.size.y - 75;

    width = 150;
    height = 150;
    anchor = Anchor.center;
  }

  @override
  void onTapDown(TapDownEvent event) {
    // TODO: implement onTapDown
    super.onTapDown(event);
    startJump();
  }

  void startJump() {
    add(
      MoveByEffect(
        Vector2(0, game.size.y * -0.5),
        EffectController(
          duration: 0.4,
          curve: Curves.fastEaseInToSlowEaseOut,
          alternate: true,
        ),
      ),
    );
  }
}
