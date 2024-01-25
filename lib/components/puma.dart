import 'package:alpaka_run/game/alpaka_run_game.dart';
import 'package:flame/components.dart';

class Puma extends SpriteAnimationComponent with HasGameRef<AlpakaRunGame> {
  Puma() : super(size: Vector2(200, 100), anchor: Anchor.bottomCenter);

  @override
  Future<void> onLoad() async {
    position = Vector2(
      game.size.x + width,
      game.size.y,
    );

    animation = await game.loadSpriteAnimation(
      'puma_spritesheet.png',
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.2,
        textureSize: Vector2(1024, 512),
      ),
    );
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
