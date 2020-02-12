import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/video.dart';

const CHAVE_YOTUBE_API = "AIzaSyDaLLM7GK4AseHf_9EQnpmDinnsrsJ2qlE";
const ID_CANAL = "UC-k_t1kx6fGrlEY0SsFSbqQ";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api{

  pesquisar(String pesquisa) async{

    http.Response response = await http.get(
      URL_BASE + "search"
      "?part=snippet"
      "&type=video"
      "&maxResults=20"
      "&order=date"
      "&key=$CHAVE_YOTUBE_API"
      "&channelId=$ID_CANAL"
      "&q=$pesquisa"
    );

    if(response.statusCode == 200){
      Map<String, dynamic> dadosJson = json.decode( response.body );
      //print("Deu Certo!" + dadosJson["items"][1]["snippet"]["title"].toString());

      List<Video> videos = dadosJson["items"].map<Video>(
        (map){
          //return Video.converterJson(map);
          return Video.fromJson(map);
        }
      ).toList();

      for(var video in videos){
        print(video.titulo);
      }

     /* for( var video in dadosJson["items"]){

        print("Deu Certo!" + video.toString());

      }*/

    }else{
      print("Deu erro! ${response.statusCode.toString}");
    }

  }

}