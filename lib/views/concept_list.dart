import 'package:concept_maps/models/graph_entities/node.dart';
import 'package:concept_maps/providers/app_provider.dart';
import 'package:concept_maps/utils/app_colors.dart';
import 'package:concept_maps/views/list_position.dart';
import 'package:concept_maps/views/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';

class ConceptList extends StatefulWidget {
  @override
  _ConceptListState createState() => _ConceptListState();
}

class _ConceptListState extends State<ConceptList> {
  List<Node> tree;
  String title;
  List<String> nodeTitles = [];
  Widget listPositions;

  @override
  void initState() {
    super.initState();
    tree = context.read<AppProvider>().tree;
    parseTitle();
    listPositions = parseSons(tree[tree.indexWhere((element) => element.parent == "-1")]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: DrawerMenu(),
      appBar: NewGradientAppBar(
        title: Text("Concept List"),
        gradient: LinearGradient(colors: [kPurpleColor, kBreezeColor]),
      ),
      body: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: 450,
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
            child: Column(
              children: [
                listPositions,
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListPosition parseSons(Node node) {
    List<Widget> sons = [];
    if (node.child.length > 0) {
      node.child.forEach((a) {
        sons.add(parseSons(tree[tree.indexWhere((i) => i.id == a)]));
      });
    } else {
      sons.add(Container());
    }
    return ListPosition(title: node.title, sons: sons);
  }

  void parseTitle() {
    for (int i = 0; i < tree.length; i++) {
      title = tree[i].title;
      nodeTitles.add(title);
    }
  }
}
