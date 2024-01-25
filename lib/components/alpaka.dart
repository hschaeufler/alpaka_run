import 'package:alpaka_run/components/hawk.dart';
import 'package:alpaka_run/components/puma.dart';
import 'package:alpaka_run/effect/jump_effect.dart';
import 'package:alpaka_run/game/alpaka_run_game.dart';
import 'package:alpaka_run/pages/home_page.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class Alpaka extends SpriteAnimationComponent
    with HasGameReference<AlpakaRunGame>, TapCallbacks, CollisionCallbacks {
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
    position.y = game.size.y + 5;

    add(RectangleHitbox());
  }

  @override
  void onTapDown(TapDownEvent event) {
    startJump();
  }

  void startJump() {
    // only jump when not already in the aur
    if (playing) {
      playing = false;
      add(
        JumpEffect(
          Vector2(0, game.size.y * -0.5),
          onMax: () => playing = true,
        ),
      );
    }
  }

  @override
  Future<void> onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) async {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Hawk || other is Puma) {
      removeFromParent();
      game.overlays.add(HomePage.endGame);
      await Future.delayed(
        const Duration(
          milliseconds: 100,
        ),
      );
      game.pauseEngine();
    }
  }
}
