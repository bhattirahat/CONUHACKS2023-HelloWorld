// ignore: file_names
// ignore: file_names
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? image;

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Camera"),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Image.network(
                  'https://static.wikia.nocookie.net/dragonball/images/e/e7/Goku_DBZ_Ep_31_008.png/revision/latest/scale-to-width-down/1000?cb=20170828193815'),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: null,
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: getImage,
                            child: Row(
                              children: [
                                Icon(Icons.camera),
                                SizedBox(width: 20),
                                Text("Take Picture"),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ));
  }
}