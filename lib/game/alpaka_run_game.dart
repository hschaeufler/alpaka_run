import 'package:alpaka_run/components/alpaka.dart';
import 'package:alpaka_run/components/background.dart';
import 'package:alpaka_run/components/hawk.dart';
import 'package:alpaka_run/components/puma.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

class AlpakaRunGame extends FlameGame {
  final bottomHeight = 80;

  late final SpawnComponent _pumaSpawner;
  late final SpawnComponent _hawkSpawner;

  @override
  Future<void> onLoad() async {
    add(Background());
    add(Alpaka());
    _pumaSpawner = SpawnComponent(
      factory: (_) => Puma(),
      period: 3,
      selfPositioning: true,
    );
    add(_pumaSpawner);
    add(Hawk());
  }
}
