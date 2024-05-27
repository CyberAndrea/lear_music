import 'package:flutter/material.dart';
import 'package:learn_music/controller/playlist_controller.dart';
import 'package:learn_music/model/album.dart';
import 'package:learn_music/model/Enum/playlist.dart';

class AlbumViewCell extends StatelessWidget {
  final Album album;
  const AlbumViewCell({required this.album});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PlaylistController(
              playlist: album.songs, title: album.title, type: Playlist.album);
        }));
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            album.songs[0].thumb,
            height: MediaQuery.of(context).size.width * 0.45,
            width: MediaQuery.of(context).size.width * 0.45,
            fit: BoxFit.cover,
          )),
    );
  }
}
