import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    /*IdeaData testIdea = IdeaData(
      title: "test idea",
      detailId: UniqueKey(),
      childrenData: [],
    );*/
    
    NodeData testNode = NodeData(
      title : "test node",
      parentId : UniqueKey(),
      branchesData : [],
      detailId : UniqueKey()
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: NodeCard( data : testNode ))),
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
  UniqueKey parentId;
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
    if (ideaList.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("No Ideas mapped yet"),
          SizedBox(height: 30),
          IconButton.filled(
            icon: Icon(Icons.add),
            onPressed: () {},
            style: IconButton.styleFrom(backgroundColor: Colors.blue),
          ),
        ],
      );
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: ideaList.length,
        itemBuilder: (BuildContext context, int index) {
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
    return Card.outlined(
      color: Colors.lightGreen,
      child: ListTile(
        leading: Icon(Icons.lightbulb, color: Colors.yellowAccent),
        title: Text(data.title),
      ),
    );
  }
}

class NodeCard extends StatelessWidget {
  final NodeData data;
  NodeCard({required this.data});

  Widget build(BuildContext context) {
    return Card.outlined(
      color: Colors.grey,
      child: ListTile(
        leading: Icon(Icons.lightbulb, color: Colors.white),
        title: Row(
          children: [
            Expanded(child : Text(data.title)),
            ElevatedButton(
              child: Icon(Icons.add),
              onPressed: () {},
              style: IconButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ],
        ),
        subtitle: ElevatedButton(
          child: Icon(Icons.more_horiz),
          onPressed: () {},
          style: IconButton.styleFrom(backgroundColor: Colors.grey),
        ),
      ),
    );
  }
}
