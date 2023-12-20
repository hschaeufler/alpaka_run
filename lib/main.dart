import 'package:alpaka_run/game/alpaka_run_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  final game = AlpakaRunGame();
  runApp(GameWidget(game: game));
}
