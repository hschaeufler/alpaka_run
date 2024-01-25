import 'package:alpaka_run/game/alpaka_run_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Hawk extends SpriteAnimationComponent with HasGameRef<AlpakaRunGame> {
  Hawk()
      : super(
          size: Vector2(200, 200),
          anchor: Anchor.topLeft,
        );

  @override
  Future<void> onLoad() async {
    position = Vector2(game.size.x, 0);

    animation = await game.loadSpriteAnimation(
      'hawk_spritesheet.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.1,
        textureSize: Vector2.all(1024),
      ),
    );

    add(RectangleHitbox(collisionType: CollisionType.passive));
  }

  @override
  void update(double dt) {
    super.update(dt);

    const speed = -500;

    position.x = position.x + dt * speed;

    if (position.x < 0) {
      removeFromParent();
    }
  }
}
