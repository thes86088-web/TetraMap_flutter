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

    /*
    NodeData testNode = NodeData(
      title : "test node",
      parentId : UniqueKey(),
      branchesData : [],
      detailId : UniqueKey()
    );
    */
    
    //UniqueKey testId = UniqueKey();
    String testTitle =  "test idea" ;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: DetailScreen(title: testTitle, /*detailId: testId */ ),
        ),
      ),
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
        title: Center(child: Text(data.title)),
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
            Expanded(child: Text(data.title)),
            ElevatedButton(
              child: Icon(Icons.more_horiz),
              onPressed: () {},
              style: IconButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ],
        ),
        /*subtitle: ElevatedButton(
          child: Icon(Icons.more_horiz),
          onPressed: () {},
          style: IconButton.styleFrom(backgroundColor: Colors.grey),
        ),*/
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;
  //final UniqueKey detailId;
  DetailScreen({/*required this.detailId,*/ required this.title});
  Widget build(BuildContext context) {
    /*String content = (AppData.detailList.where(
      (map) => detailId == map.keys.first,
    )).toList().first.values.first;
    */
    Widget defaultBody = Card(
                  child: Column(
                    children: [
                      Text("The idea has no detailed description yet"),
                      ElevatedButton(
                        child: Icon(Icons.add),
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ) ;


    return Scaffold(
      appBar: AppBar(title: const Text("DetailScreen")),
      body: Column(
        mainAxisAlignment : MainAxisAlignment.center,
        children: [
          Card(child: Text(title)),
          //(content == "" || content.isEmpty) ?
               defaultBody
          //    : Card(child: Text(content)),
        ],
      ),
    );
  }
}
//class BranchMapScreen

class IdeaMapScreen extends StatelessWidget {
  final UniqueKey ideaKey;
  IdeaMapScreen({required this.ideaKey});

  Widget build(BuildContext context) {
    IdeaData testIdea = IdeaData(
      title: "test idea",
      detailId: UniqueKey(),
      childrenData: [],
    );

    NodeData testNode1 = NodeData(
      title: "test node 1",
      parentId: UniqueKey(),
      branchesData: [],
      detailId: UniqueKey(),
    );

    NodeData testNode2 = NodeData(
      title: "test node 2",
      parentId: UniqueKey(),
      branchesData: [],
      detailId: UniqueKey(),
    );

    NodeData testNode3 = NodeData(
      title: "test node 3",
      parentId: UniqueKey(),
      branchesData: [],
      detailId: UniqueKey(),
    );

    NodeData testNode4 = NodeData(
      title: "test node 4",
      parentId: UniqueKey(),
      branchesData: [],
      detailId: UniqueKey(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("IdeaMapScreen") /*Text( ideaKey.toString() )*/,
      ),
      body: Column(
        children: [
          Column(
            children: [
              NodeCard(data: testNode1),
              NodeCard(data: testNode2),
            ],
          ),
          IdeaCard(data: testIdea),
          Column(
            children: [
              NodeCard(data: testNode3),
              NodeCard(data: testNode4),
            ],
          ),
        ],
      ),
    );
  }
}

class BranchMapScreen extends StatelessWidget {
  final UniqueKey nodeKey;
  BranchMapScreen({required this.nodeKey});

  Widget build(BuildContext context) {
    IdeaData testIdea = IdeaData(
      title: "test idea",
      detailId: UniqueKey(),
      childrenData: [],
    );

    NodeData testNode1 = NodeData(
      title: "test node 1",
      parentId: UniqueKey(),
      branchesData: [],
      detailId: UniqueKey(),
    );

    NodeData testNode2 = NodeData(
      title: "test node 2",
      parentId: UniqueKey(),
      branchesData: [],
      detailId: UniqueKey(),
    );

    NodeData testNode3 = NodeData(
      title: "test node 3",
      parentId: UniqueKey(),
      branchesData: [],
      detailId: UniqueKey(),
    );

    NodeData testNode4 = NodeData(
      title: "test node 4",
      parentId: UniqueKey(),
      branchesData: [],
      detailId: UniqueKey(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("BranchMapScreen") /*Text( ideaKey.toString() )*/,
      ),
      body: Column(
        children: [
          IdeaCard(data: testIdea),
          Column(
            children: [
              NodeCard(data: testNode1),
              NodeCard(data: testNode2),
              NodeCard(data: testNode3),
              NodeCard(data: testNode4),
            ],
          ),
        ],
      ),
    );
  }
}
