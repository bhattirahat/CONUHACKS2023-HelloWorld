// ignore: file_names
// ignore: file_names
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
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
        _upload(imageTemp);
      });
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }

  void _upload(File file) async {
    String fileName = file.path.split('/').last;
    print(fileName);

    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    Dio dio = new Dio();
    dio.options.headers['Prediction-Key'] = 'c0cae620c5a04827b77770c4d7b17e79';
    dio.options.headers['Content-Type'] = 'application/octet-stream';

    dio
        .post(
            "https://conuhackstestvision-prediction.cognitiveservices.azure.com/customvision/v3.0/Prediction/f4ba3506-b2a3-4398-a13f-b187e13a0fc7/classify/iterations/Iteration7/image",
            data: data)
        .then((response) {
      var jsonResponse = jsonDecode(response.toString());
      var prob = jsonResponse['predictions'][0]['probability'];
      var tag = jsonResponse['predictions'][0]['tagName'];

      print(jsonResponse);
      print(prob);
      print(tag);
      showAlertDialog(context, tag);
      postRequest(1);
    }).catchError((error) => print(error));
  }

  showAlertDialog(BuildContext context, message) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("This belongs in the " + message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
              image != null
                  ? Image.file(
                      image!,
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    )
                  : Text("try another picture"),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: getImage,
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

Future<http.Response> postRequest(int) async {
  var uri = "http://localhost:8080/api/stream/";
  // 10.0.0.158 has to replace localhost for it to work with pixel4
  // equal to local wifi of the development computer
  var path = 'assets/files/example_2.json';
  String text = await rootBundle.loadString(path);

  Map data = {
    'recycle': int.toString(),
    'garbage': 0.toString(),
    "compost": 0.toString()
  };

  var body = json.encode(data);
  var response = await http.post(Uri.parse(uri),
      headers: {"Content-Type": "application/json"}, body: body);

  print("${response.statusCode}");
  print("${response.body}");

  return response;
}
