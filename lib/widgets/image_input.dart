import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedFile;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          child: _storedFile != null
              ? Image.file(
                  _storedFile,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text("No Image Taken", textAlign: TextAlign.center),
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
        ),
        SizedBox(width: 10.0),
        FlatButton.icon(
          textColor: Theme.of(context).primaryColor,
          onPressed: (){},
          icon: Icon(Icons.camera),
          label: Text("Take Picture"),
        )
      ],
    );
  }
}
