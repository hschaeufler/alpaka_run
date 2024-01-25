import 'package:alpaka_run/components/alpaka.dart';
import 'package:alpaka_run/components/background.dart';
import 'package:alpaka_run/components/hawk.dart';
import 'package:alpaka_run/components/puma.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

class AlpakaRunGame extends FlameGame with HasCollisionDetection {
  final bottomHeight = 80;

  late final SpawnComponent _pumaSpawner;
  late final SpawnComponent _hawkSpawner;

  late final Alpaka _alpaka;

  @override
  Future<void> onLoad() async {
    add(Background());
    _alpaka = Alpaka();
    _pumaSpawner = SpawnComponent.periodRange(
      factory: (index) => Puma(),
      minPeriod: 2,
      maxPeriod: 3,
      selfPositioning: true,
    );
    _hawkSpawner = SpawnComponent.periodRange(
      factory: (index) => Hawk(),
      minPeriod: 10,
      maxPeriod: 15,
      selfPositioning: true,
    );
    add(_alpaka);
    add(_pumaSpawner);
    add(_hawkSpawner);
  }

  Future<void> resetGame() async {
    await Future.delayed(const Duration(seconds: 5));
    _pumaSpawner.timer.reset();
    _hawkSpawner.timer.reset();
    add(_alpaka);
  }
}
