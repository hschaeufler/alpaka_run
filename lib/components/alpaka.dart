import 'package:alpaka_run/effect/jump_effect.dart';
import 'package:alpaka_run/game/alpaka_run_game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class Alpaka extends SpriteAnimationComponent
    with HasGameReference<AlpakaRunGame>, TapCallbacks {
  Alpaka() : super(size: Vector2(150, 150), anchor: Anchor.bottomLeft);

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

    position.x = width / 4;
    position.y = game.size.y;
  }

  @override
  void onTapDown(TapDownEvent event) {
    startJump();
  }

  void startJump() {
    add(JumpEffect(Vector2(0, game.size.y * -0.5)));
  }
}
