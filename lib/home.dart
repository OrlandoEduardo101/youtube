import 'package:flutter/material.dart';
import 'package:youtube/customSearchDelegate.dart';
import 'package:youtube/telas/biblioteca.dart';
import 'package:youtube/telas/emAlta.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  List<MaterialColor> _appbar = [Colors.blue, Colors.yellow, Colors.green,Colors.blue];

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:Colors.red,
          opacity: 0.8,
        ),
        backgroundColor: _appbar[_indiceAtual],
          title: Image.asset(
            "images/youtube.png",
            width:98,
            height: 22,
            ),
          actions: <Widget>[

            IconButton(
              icon: Icon(Icons.search), 
              onPressed: () async{
                String res = await showSearch(
                  context: context, 
                  delegate: CustomSearchDelegate()
                  );
                print(res);
              }
              /*
            IconButton(
              icon: Icon(Icons.videocam), 
              onPressed: (){
                print("videocam");
              }
              ),
              
              ),
              IconButton(
              icon: Icon(Icons.account_circle), 
              onPressed: (){
                print("conta");
              }*/
              ),
          ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
        ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: _indiceAtual,
        onTap: (indice){
          print(_indiceAtual);
          setState(() {
            _indiceAtual = indice;
            print(_indiceAtual);
          });
        },
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: _appbar[0],
            title: Text("inicio"),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            backgroundColor:  _appbar[1],
            title: Text("em alta"),
            icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
            backgroundColor:  _appbar[2],
            title: Text("inscrições"),
            icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
            backgroundColor:  _appbar[3],
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder)
          ),
        ]
      ),
    );
  }
}