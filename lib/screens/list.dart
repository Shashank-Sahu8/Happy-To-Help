import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(backgroundImage: AssetImage("assets/logo.jpeg")),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [SizedBox(height: 15,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Basketball Teams',style: GoogleFonts.brunoAceSc(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w900),),
                  ],
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: Stack(
                    children: [
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
                         decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight:Radius.circular(40) ) ,color: Color(0xff0076FF),),
                          child: Image(image:  AssetImage("assets/ball.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: ValueListenableBuilder(
                          valueListenable: teamBox.listenable(),
                          builder: (context, Box<Team> box, _) {
                            if (box.values.isEmpty) {
                              return Center(child: Text('No teams available.'));
                            }
                            return ListView.builder(
                              itemCount: box.length,
                              itemBuilder: (context, index) {
                                final team = box.getAt(index);
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    splashColor: Colors.blueGrey,
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerCardScreen(team: team)));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(color:Color(0xff146cdc),
                                        boxShadow: [BoxShadow(color: Colors.blueGrey,
                                        spreadRadius: 0.1,
                                        blurRadius: 1,
                                        offset: Offset(0.2 ,0.3), )],
                                          borderRadius: BorderRadius.all(Radius.circular(15)) ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.arrow_circle_right_outlined,color: Colors.black,),
                                            SizedBox(width: 14,),
        
                                            Text(team!.name,style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 20),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
        
                              },
                            );
                          },
                        ),
                      ),
        
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          barrierLabel: "Add Team",
          builder: (context) => AddTeamDialog(onAdd: _addTeam),
        ),
        child: Icon(Icons.add,color: Colors.black,),backgroundColor: Color(0xfffcc200),
      ),
    );
  }
}
