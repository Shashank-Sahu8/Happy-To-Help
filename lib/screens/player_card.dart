import 'package:flutter/material.dart';
import '../function/add_player_dialogue.dart';
import '../model/player.dart';
import '../model/team.dart';

class PlayerCardScreen extends StatefulWidget {
  final Team team;

  PlayerCardScreen({required this.team});

  @override
  State<PlayerCardScreen> createState() => _PlayerCardScreenState();
}

class _PlayerCardScreenState extends State<PlayerCardScreen> {
  void _addPlayer(Player player) {
    setState(() {
      widget.team.players.add(player);
      widget.team.save();
    });
  }

  void _deletePlayer(int index) {
    setState(() {
      widget.team.players.removeAt(index);
      widget.team.save();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.team.name} Players'),
      ),
      body: ListView.builder(
        itemCount: widget.team.players.length,
        itemBuilder: (context, index) {
          final player = widget.team.players[index];
          return Card(
            margin: EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(player.image),
                      ),
                      SizedBox(height: 15),
                      Text(
                        player.name,
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        player.position,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 15),
                      Divider(color: Colors.blueAccent),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatColumn('Points', player.pointsPerGame),
                          _buildStatColumn('Assists', player.assistsPerGame),
                          _buildStatColumn('Rebounds', player.reboundsPerGame),
                        ],
                      ),
                    ],
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _deletePlayer(index);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddPlayerDialog(onAdd: _addPlayer),
        ),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildStatColumn(String label, double value) {
    return Column(
      children: [
        Text(
          value.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
