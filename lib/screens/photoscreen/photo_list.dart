import 'package:flutter/material.dart';
import 'package:fluttersubmoduleone/models/photo_model.dart';


class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos, this.crossAxisCount = 5, this.childAspectRatio = 1}) : super(key: key);

  final List<Photo> photos;
  final int? crossAxisCount;
  final double? childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount!,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: childAspectRatio!
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Image.network(photos[index].thumbnailUrl),
          onTap: (){
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => PhotoDetailsScreen(photo: photos[index],
            //         )));
          },
        );
      },
    );
  }
}