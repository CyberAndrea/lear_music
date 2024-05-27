import 'package:flutter/material.dart';
import 'package:learn_music/model/artist.dart';

class ArtistCircleCell extends StatelessWidget {
  final Artist artist;
  const ArtistCircleCell({Key? key,required this.artist, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.network(
              artist.urlImage,
              width: height,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.supervised_user_circle, color: Colors.grey, size: height)
            ),
          ),
        ));
  }
}
