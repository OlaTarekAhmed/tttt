import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:test/project/wordSheet.dart';
import 'package:test/project/wordwidget.dart';
import 'package:test/project/model.dart';

class WordScreen extends StatefulWidget {
  const WordScreen({Key? key}) : super(key: key);

  @override
  State<WordScreen> createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  final List<Model> words = [];
  bool isDeleted = false;
  void deleteWord(String id) {
    setState(() {
      words.removeWhere((element) => element.id == id);
    });
  }

  void addWord(Model word) {
    setState(() {
      words.add(word);
    });
    Navigator.of(context).pop();
  }

  showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheetWidget(addWord: addWord),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(250, 207, 39, 137),
        title: const Text(
          "MyShop",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isDeleted = !isDeleted;
              });
            },
            icon: isDeleted ? const Icon(Icons.done) : const Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: ((context, index) => WordTile(
                title: words[index].title,
                description: words[index].description,
                trailing: isDeleted
                    ? IconButton(
                        onPressed: () => deleteWord(words[index].id),
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.red,
                        ))
                    : const SizedBox(),
              )),
          itemCount: words.length,
        ),
      ),
      floatingActionButton: SizedBox(
        height: 100,
        child: Center(
          child: FloatingActionButton(
            onPressed: showBottomSheet,
            child: Center(child: Text("Add")),
            backgroundColor: Color.fromARGB(250, 207, 39, 137),
          ),
        ),
      ),
    );
  }
}
