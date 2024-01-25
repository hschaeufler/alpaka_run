import 'package:alpaka_run/game/alpaka_run_game.dart';
import 'package:flame/components.dart';

class Puma extends SpriteAnimationComponent with HasGameRef<AlpakaRunGame> {
  Puma() : super(size: Vector2(300, 300), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    animation = await game.loadSpriteAnimation(
      'puma_spritesheet.png',
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.1,
        textureSize: Vector2.all(1024),
      ),
    );

    position.x = game.size.x;
    position.y = game.size.y - 100;
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
