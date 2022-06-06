import 'package:flutter/material.dart';
import 'package:fluttersubmoduleone/models/photo_model.dart';
import 'package:fluttersubmoduleone/services/api_services.dart';
import 'package:http/http.dart' as http;
import 'photo_list.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Photos"),),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!,crossAxisCount: _size.width < 650 ? 3 : 6, childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1 );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}