import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),


    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> displayxoh=['','','','','','','','',''];
bool ohTurn= true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: GridView.builder(
        itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context,int index){
          return GestureDetector(
            onTap: (){
              _tapped(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade700)
              ),
              child: Center(
                child: Text(
                 displayxoh[index],style: TextStyle(color: Colors.white,fontSize: 40),
                ),
              ),

            ),
          );

    },
    ));
  }

   _tapped(int index){
    setState(() {
      if(ohTurn) {
        displayxoh[index] = 'o';
      }
      else{
        displayxoh[index]='x';
      }
      ohTurn=!ohTurn;
      _checkWinner();
    });
  }
  _showWinDialogBox(String winner){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(' $winner is winner'),
        actions: [TextButton(
          child: const Text("OK"),
          onPressed:(){
          Navigator.of(context).pop();
            _resetGame();
          },
             )
        ],
      );
    });
  }


  void _checkWinner(){
    //row 1
    if(displayxoh[0]==displayxoh[1]&& displayxoh[0]==displayxoh[2]&&displayxoh[0]!=''){
      _showWinDialogBox(displayxoh[0]);
    }
    //row2
    if(displayxoh[3]==displayxoh[4]&& displayxoh[3]==displayxoh[5]&&displayxoh[3]!=''){
      _showWinDialogBox(displayxoh[3]);
    }
    //row 3
    if(displayxoh[6]==displayxoh[7]&& displayxoh[6]==displayxoh[8]&&displayxoh[6]!=''){
      _showWinDialogBox(displayxoh[6]);}

    //column1
    if(displayxoh[0]==displayxoh[3]&& displayxoh[0]==displayxoh[6]&&displayxoh[0]!=''){
      _showWinDialogBox(displayxoh[0]);
    }
    //col 2
      if(displayxoh[1]==displayxoh[4]&& displayxoh[1]==displayxoh[7]&&displayxoh[1]!=''){
        _showWinDialogBox(displayxoh[1]);
      }
      //col3
      if(displayxoh[2]==displayxoh[5]&& displayxoh[2]==displayxoh[8]&&displayxoh[2]!=''){
        _showWinDialogBox(displayxoh[2]);
      }
      //diagonal
      if(displayxoh[0]==displayxoh[4]&& displayxoh[0]==displayxoh[8]&&displayxoh[0]!=''){
        _showWinDialogBox(displayxoh[0]);
      }
      //di 2
      if(displayxoh[6]==displayxoh[4]&& displayxoh[6]==displayxoh[2]&&displayxoh[6]!=''){
        _showWinDialogBox(displayxoh[6]);
      }

  }

  void _resetGame() {
    setState(() {
      displayxoh = ['', '', '', '', '', '', '', '', ''];
      ohTurn = true;
    });
  }


  }


