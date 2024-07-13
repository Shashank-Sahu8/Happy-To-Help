import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
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
        backgroundColor: Color(0xff0076FF),elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new),onPressed: (){Navigator.pop(context);},),
        title: Text('${widget.team.name} Players',style: GoogleFonts.inter(fontWeight: FontWeight.w800,fontSize: 25),),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xff0076FF),),
              child: Image(image:  AssetImage("assets/ball.png"),fit: BoxFit.cover,),
            ),
          ),
          ListView.builder(
            itemCount: widget.team.players.length,
            itemBuilder: (context, index) {
              final player = widget.team.players[index];
              return Card(color: Colors.white,
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
                            radius: 50,backgroundColor: Colors.grey,
                              backgroundImage: NetworkImage(player.image)


                          ),
                          SizedBox(height: 15),
                          Text(
                            player.name,
                            style: GoogleFonts.inter(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                            icon: Icon(Icons.delete, color: Colors.black),
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddPlayerDialog(onAdd: _addPlayer),
        ),backgroundColor: Color(0xfffcc200),
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
            color: Color(0xff0076FF),
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
