import 'package:alpaka_run/components/hawk.dart';
import 'package:alpaka_run/components/puma.dart';
import 'package:alpaka_run/effect/jump_effect.dart';
import 'package:alpaka_run/game/alpaka_run_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Alpaka extends SpriteAnimationComponent
    with HasGameReference<AlpakaRunGame>, CollisionCallbacks {
  var isWalking = true;

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

  void startJump() {
    if (!isWalking) {
      return;
    }
    isWalking = playing = false;
    add(
      JumpEffect(
        Vector2(0, game.size.y * -0.5),
        onMax: () => isWalking = playing = true,
      ),
    );
  }

  @override
  Future<void> onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) async {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Hawk || other is Puma) {
      removeFromParent();
      await Future.delayed(const Duration(milliseconds: 100));
      game.endGame();
    }
  }
}
