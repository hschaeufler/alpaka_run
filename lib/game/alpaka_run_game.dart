import 'package:alpaka_run/components/alpaka.dart';
import 'package:alpaka_run/components/background.dart';
import 'package:alpaka_run/components/hawk.dart';
import 'package:alpaka_run/components/puma.dart';
import 'package:flame/game.dart';

class AlpakaRunGame extends FlameGame {
  late Alpaka alpakaComponent;

  @override
  Future<void> onLoad() async {
    add(Background());
    alpakaComponent = Alpaka();
    add(alpakaComponent);
    add(Puma());
    add(Hawk());
  }
}
