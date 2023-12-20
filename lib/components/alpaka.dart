import 'package:alpaka_run/game/alpaka_run_game.dart';
import 'package:flame/components.dart';

class Alpaka extends SpriteAnimationComponent
    with HasGameReference<AlpakaRunGame> {
  @override
  Future<void> onLoad() async {
    animation = await game.loadSpriteAnimation(
        'alpaka_spritesheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.2,
          textureSize: Vector2.all(1024),
        ));

    position.x = game.size.x / 2;
    position.y = game.size.y - 75;

    width = 150;
    height = 150;
    anchor = Anchor.center;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
