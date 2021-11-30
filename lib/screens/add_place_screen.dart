import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/great_places.dart';
import 'package:flutter_complete_guide/widgets/image_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _textController = TextEditingController();
  File _pickedImage;
  void onSelectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_textController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_textController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Place"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("User Inputs"),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _textController),
                SizedBox(height: 10.0),
                ImageInput(onSelectImage)
              ],
            ),
          ))),
          ElevatedButton.icon(
            onPressed: _savePlace,
            icon: Icon(Icons.add),
            label: Text("Add Place"),
          )
        ],
      ),
    );
  }
}
