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

    position.x = game.size.x / 4 * 3;
    position.y = game.size.y - 100;
  }
}
