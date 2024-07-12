import 'package:flutter/material.dart';
import 'package:h_to_h/model/team.dart';
import 'package:h_to_h/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/list.dart';
import 'model/player.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TeamAdapter());
  Hive.registerAdapter(PlayerAdapter());
  var teamBox =await Hive.openBox<Team>('teams');
  if (teamBox.isEmpty) {
    addDefaultData(teamBox);
  }
  runApp(MyApp());
}
void addDefaultData(Box<Team> teamBox) {
  var teams = [
    Team(name: 'Bulls', players: [
      Player(
      name: 'Lonzo Ball',
      image: 'https://cdn.nba.com/headshots/nba/latest/1040x760/1628366.png',
        position: 'Position PG',
      pointsPerGame: 10.0 ,
      assistsPerGame: 5.0 ,
      reboundsPerGame: 7.0 ,
    ),
      Player(
        name: 'Onuralp Bitim',
        image: 'https://pbs.twimg.com/media/GJ_1gM9WIAAoMDo?format=jpg&name=4096x4096',
        position: 'Position SF',
        pointsPerGame: 10.0 ,
        assistsPerGame: 5.0 ,
        reboundsPerGame: 7.0 ,
      ),
      Player(
        name: 'Matas Buzelis',
        image: 'https://www.si.com/.image/t_share/MjAzNzU1Nzk4OTI3NTE3MTc5/gettyimages-1915751539.jpg',
        position: 'Position F',
        pointsPerGame: 10.0 ,
        assistsPerGame: 5.0 ,
        reboundsPerGame: 7.0 ,
      ),
      Player(
        name: 'Jevon Carter',
        image: 'https://b.fssta.com/uploads/application/nba/headshots/2521.png',
        position: 'Position PG',
        pointsPerGame: 10.0 ,
        assistsPerGame: 5.0 ,
        reboundsPerGame: 7.0 ,
      ),
      Player(
        name: 'Torrey Craig',
        image: 'https://www.si.com/.image/t_share/MjAxMjk5MTM4NTY5MDUzNDQ4/usatsi_21554209_168397759_lowres.jpg',
        position: 'Position SF',
        pointsPerGame: 10.0 ,
        assistsPerGame: 5.0 ,
        reboundsPerGame: 7.0 ,
      ),
      Player(
        name: 'Ayo Dosunmu',
        image: 'https://imageio.forbes.com/specials-images/imageserve/63698860fcddb806a7af29b7/Chicago-Bulls-v-Brooklyn-Nets/960x0.jpg?format=jpg&width=960',
        position: 'Position SG',
        pointsPerGame: 10.0 ,
        assistsPerGame: 5.0 ,
        reboundsPerGame: 7.0 ,
      ),
      Player(
        name: 'Henri Drell',
        image: 'https://upload.wikimedia.org/wikipedia/commons/6/61/Henri_Drell_%28cropped%29.jpg',
        position: 'Position F',
        pointsPerGame: 10.0 ,
        assistsPerGame: 5.0 ,
        reboundsPerGame: 7.0 ,
      ),
      Player(
        name: 'Chris Duarte',
        image: 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4592402.png',
        position: 'Position SG',
        pointsPerGame: 10.0 ,
        assistsPerGame: 5.0 ,
        reboundsPerGame: 7.0 ,
      ),
      Player(
        name: '	Andrew Funk',
        image: 'https://cdn.nba.com/headshots/nba/latest/1040x760/1641847.png',
        position: 'Position G',
        pointsPerGame: 10.0 ,
        assistsPerGame: 5.0 ,
        reboundsPerGame: 7.0 ,
      ),
      Player(
        name: '	Josh Giddey',
        image: 'https://dims.apnews.com/dims4/default/e71b8cc/2147483647/strip/true/crop/6184x4123+0+0/resize/599x399!/quality/90/?url=https%3A%2F%2Fassets.apnews.com%2F0a%2F16%2F8035a50056ba626770b5b46e5564%2F2b1fe4464fc04dc997025fe9e154ab16',
        position: 'Position SG',
        pointsPerGame: 10.0 ,
        assistsPerGame: 5.0 ,
        reboundsPerGame: 7.0 ,
      ),
    ]),
    Team(name: 'yello', players: List.generate(10, (index) => Player(
      name: 'Player ${index + 1}',
      image: 'https://via.placeholder.com/150',
      position: 'Position ${index + 11}',
      pointsPerGame: 12.0 + index,
      assistsPerGame: 6.0 + index,
      reboundsPerGame: 8.0 + index,
    ))),
  ];

  for (var team in teams) {
    teamBox.add(team);
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: splash_screen1(),
    );
  }
}
