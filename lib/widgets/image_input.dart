import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as sysPath;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  ImageInput(this.onSelectImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedFile;

  Future<void> _takePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile imageFile =
        await picker.pickImage(source: ImageSource.camera, maxWidth: 600);
        if(imageFile == null) {
          return;
        }
    setState(() {
      _storedFile = File(imageFile.path);
    });
    final appPath = await sysPath.getApplicationDocumentsDirectory();
    final fileName = p.basename(imageFile.path); 
    final savedImage = await _storedFile.copy('${appPath.path}/$fileName');
    widget.onSelectImage(savedImage);
   
  }

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
        Expanded(
          child: FlatButton.icon(
            textColor: Theme.of(context).primaryColor,
            onPressed: _takePicture,
            icon: Icon(Icons.camera),
            label: Text("Take Picture"),
          ),
        )
      ],
    );
  }
}
