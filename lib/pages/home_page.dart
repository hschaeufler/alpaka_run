import 'package:alpaka_run/game/alpaka_run_game.dart';
import 'package:alpaka_run/widgets/menu_card.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String endGame = 'endGame';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AlpakaRunGame game;

  @override
  void initState() {
    super.initState();
    game = AlpakaRunGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: game,
        overlayBuilderMap: {
          HomePage.endGame: (context, game) => MenuCard(
                onRetry: () => setState(() => this.game = AlpakaRunGame()),
              ),
        },
      ),
    );
  }
}
