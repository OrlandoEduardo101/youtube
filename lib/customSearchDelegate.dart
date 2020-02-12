import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: (){
          query = "";
        }
        ),
       /* IconButton(
        icon: Icon(Icons.done), 
        onPressed: (){

        }
        )*/
    ];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return 
      IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){

          close(context, null);

        }
        );
    
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    //print("Pesquisa Realizada!");
     close(context, query);
    return Container();
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //print("Digitado " + query);
    return Container();
    throw UnimplementedError();
  }

}