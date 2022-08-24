import 'package:flutter/material.dart';
import 'package:test/project/model.dart';

class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget({
    Key? key,
    required this.addWord,
  }) : super(key: key);
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _imagController = TextEditingController();
  final Function addWord;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Card(
          color: Color.fromARGB(254, 184, 191, 193),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _titleController,
                  
                   style: TextStyle(color: Color.fromARGB(250, 207, 39, 137)),
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    hintText: 'Enter the new title',
                  ),
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    hintText: 'Enter the new price',
                  ),
                ),
                TextFormField(
                  controller: _descController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: 'Enter the word description',
                  ),
                  maxLines: 3,
                ),
                TextFormField(
                  controller: _imagController,
                  decoration: const InputDecoration(
                    labelText: 'Image URL',
                    hintText: 'Enter the new imageURL',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_titleController.text.isEmpty ||
                        _descController.text.isEmpty) return;
                    return addWord(Model(
                      id: DateTime.now().toString(),
                      title: _titleController.text.trim(),
                      price: _priceController.text.trim(),
                      imageURL: _imagController.text.trim(),
                      description: _descController.text.trim(),
                    ));
                  },
                  child: const Text('Add'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
