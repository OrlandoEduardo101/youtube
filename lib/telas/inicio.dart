import 'package:flutter/material.dart';
import 'package:youtube/api.dart';
import 'package:youtube/model/video.dart';

class Inicio extends StatefulWidget {

  String pesquisa;

  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _ListarVideos(String pesquisa){

    Future<List<Video>>  videos;

    Api api = Api();
    videos = api.pesquisar(pesquisa);

    return videos;
  }


   @override
  Widget build(BuildContext context) {

    

    return FutureBuilder< List<Video> >(
      future:_ListarVideos(widget.pesquisa),
      builder: (context, snapshot) { 

        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData){

              return ListView.separated(
                itemBuilder: (context, index){

                  List<Video> videos = snapshot.data;
                  Video video = videos[index];

                  return Column(
                    children: <Widget>[
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit:BoxFit.cover,
                            image: NetworkImage(video.imagem),
                          )
                        )
                      ),
                      ListTile(
                        title: Text(video.titulo),
                        subtitle: Text(video.canal),
                      )
                    ],
                  );

                }, 
                separatorBuilder: (context, index) => Divider(
                  height: 2,
                  color: Colors.blueGrey
                ), 
                itemCount: snapshot.data.length
                );

            }else{

               return Center(
              child: Text("Nada a ser exibido!!"),
            );

            }
            break;
        }

       },

    );
  }
}