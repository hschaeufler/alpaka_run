import 'package:alpaka_run/components/alpaka.dart';
import 'package:alpaka_run/components/background.dart';
import 'package:alpaka_run/components/puma.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

class AlpakaRunGame extends FlameGame with PanDetector {
  late Alpaka alpakaComponent;

  @override
  Future<void> onLoad() async {
    add(Background());
    alpakaComponent = Alpaka();
    add(alpakaComponent);
    add(Puma());
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    alpakaComponent.move(info.delta.global);
  }
}
