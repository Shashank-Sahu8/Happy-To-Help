import 'package:flutter/material.dart';
import 'package:h_to_h/screens/player_card.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../function/add_team_dialogue.dart';
import '../model/player.dart';
import '../model/team.dart';

class TeamListScreen extends StatefulWidget {
  @override
  _TeamListScreenState createState() => _TeamListScreenState();
}

class _TeamListScreenState extends State<TeamListScreen> {
  final Box<Team> teamBox = Hive.box<Team>('teams');

  void _addTeam(String name) {
    final team = Team(
      name: name,
      players: [
        Player(
          name: 'Demo Player',
          image: 'https://example.com/player.jpg',
          position: 'Guard',
          pointsPerGame: 20.0,
          assistsPerGame: 5.0,
          reboundsPerGame: 7.0,
        ),
        Player(
          name: 'Demo',
          image: 'https://example.com/player.jpg',
          position: 'Guard',
          pointsPerGame: 2.0,
          assistsPerGame: 5.0,
          reboundsPerGame: 07.0,
        ),
      ],
    );
    teamBox.add(team);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0077FF),
      appBar: AppBar(centerTitle: true,backgroundColor: Color(0xff0077FF),
        title: Text('Basketball Teams',textAlign: TextAlign.center,),
      ),
      body: ValueListenableBuilder(
        valueListenable: teamBox.listenable(),
        builder: (context, Box<Team> box, _) {
          if (box.values.isEmpty) {
            return Center(child: Text('No teams available.'));
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final team = box.getAt(index);
              return ListTile(
                title: Text(team!.name),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerCardScreen(team: team),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTeamDialog(onAdd: _addTeam),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
