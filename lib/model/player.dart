import 'package:hive/hive.dart';

part 'player.g.dart';

@HiveType(typeId: 1)
class Player extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String image;

  @HiveField(2)
  String position;

  @HiveField(3)
  double pointsPerGame;

  @HiveField(4)
  double assistsPerGame;

  @HiveField(5)
  double reboundsPerGame;

  Player({
    required this.name,
    required this.image,
    required this.position,
    required this.pointsPerGame,
    required this.assistsPerGame,
    required this.reboundsPerGame,
  });
}
