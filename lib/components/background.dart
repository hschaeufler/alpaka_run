import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

class Background extends ParallaxComponent {
  @override
  Future<void> onLoad() async {
    final layers = [
      ParallaxImageData('scenery/hintergrund_0.png'),
      ParallaxImageData('scenery/hintergrund_1.png'),
      ParallaxImageData('scenery/hintergrund_2.png'),
    ];

    final baseVelocity = Vector2(4, 0);
    final velocityMultiplierDelta = Vector2(2, 0);

    parallax = await game.loadParallax(
      layers,
      baseVelocity: baseVelocity,
      velocityMultiplierDelta: velocityMultiplierDelta,
      repeat: ImageRepeat.repeat,
    );
  }
}
