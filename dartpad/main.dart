import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
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
  static final List<Map<UniqueKey, NodeData>> nodeList = [];
  static final List<Map<UniqueKey, IdeaData>> ideaList = [];
  static final List<Map<UniqueKey, String>> detailList = [];

  //static void createNode(  ){ };
  //static void createIdea(  ){ };
}

class IdeaData {
  //static final List<UniqueKey> ideaList

  //UniqueKey ideaId = UniqueKey();
  String title;
  List<NodeData> childrenData;
  UniqueKey detailId;

  IdeaData({
    required this.title,
    required this.childrenData,
    required this.detailId,
  });
}

class NodeData {
  //UniqueKey nodeId = UniqueKey();
  String title;
  UniqueKey parentId ;
  UniqueKey detailId;
  List<NodeData> branchesData;

  NodeData({
    required this.title,
    required this.parentId,
    required this.branchesData,
    required this.detailId,
  });
}

class IdeaScreen extends StatelessWidget {
  final List<Map<UniqueKey, IdeaData>> ideaList = AppData.ideaList;
  //IdeaScreen( {required this.ideaList}  );

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: ideaList.length,
        itemBuilder: (BuildContext context, int index) {
          if (ideaList.isEmpty) {
            return Column(
              children: [
                Text("No Ideas mapped yet"),
                IconButton(icon: Icon(Icons.add), onPressed: () {}),
              ],
            );
          }

          Map<UniqueKey, IdeaData> tempIdea = ideaList[index];
          //UniqueKey tempId = tempIdea.keys.first ;
          IdeaData tempData = tempIdea.values.first;
          return IdeaCard(data: tempData);
        },
      ),
    );
  }
}

class IdeaCard extends StatelessWidget {
  final IdeaData data;
  IdeaCard({required this.data});

  Widget build(BuildContext context) {
    return Card(
      child: ListTile(leading: Icon(Icons.lightbulb), title: Text(data.title)),
    );
  }
}
