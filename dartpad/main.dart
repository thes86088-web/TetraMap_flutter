import 'package:flutter/material.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text('Hello, World!'))),
    );
  }
}

class AppData {
  
  static final List<Map<UniqueKey, NodeData>> nodeList = [] ;
  static final List<Map<UniqueKey, IdeaData>> ideaList = [] ;
  
  //static void createNode(  ){ };
  //static void createIdea(  ){ }; 
}

class IdeaData {
  
  //static final List<UniqueKey> ideaList 
  
  //UniqueKey ideaId = UniqueKey();
  String title ;
  List<NodeData> childrenData;
  UniqueKey detailId;
  
  IdeaData( { required this.title, required this.childrenData, required this.detailId } );
}

class NodeData {
  //UniqueKey nodeId = UniqueKey();
  String title ;
  UniqueKey detailId ;
  List<NodeData> branchesData;
  
  NodeData( { required this.title, required this.branchesData, required this.detailId } );
}

/*
class IdeaScreen extends StatelessWidget{
  
 List<IdeaData> ideaList; 
 IdeaScreen( {required this.ideaList}  );
  
  Widget build( BuildContext context ){
    return Scaffold( body : ListView.builder( index : ideaList.length(), itemBuilder : IdeaCard( )));
  }
  
}
*/
