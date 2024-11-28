import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camara extends StatefulWidget {
  @override
  _CamaraState createState() => _CamaraState();
}

class _CamaraState extends State<Camara> {
  File? imageFile; // Ahora es opcional

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picture != null) {
      setState(() {
        imageFile = File(picture.path);
      });
    }
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picture != null) {
      setState(() {
        imageFile = File(picture.path);
      });
    }
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Seleccione"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _openGallery(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Galería"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _openCamera(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Cámara"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      return Text("No se ha seleccionado ninguna imagen");
    } else {
      return Image.file(imageFile!, width: 400, height: 400);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cámara'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _decideImageView(),
            ElevatedButton(
              onPressed: () {
                _showChoiceDialog(context);
              },
              child: Text("Seleccionar imagen"),
            ),
          ],
        ),
      ),
    );
  }
}
