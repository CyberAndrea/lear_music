import 'package:flutter/material.dart';
import 'package:learn_music/views/albums_container.dart';
import 'package:learn_music/views/artist_container.dart';
import 'package:learn_music/views/genre_container.dart';

class MusicView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Divider(), 
            ArtistContainer(),
             const Divider(), 
             AlbumsContainer(),
             const Divider(),
             GenreContainer()
            ],
        ),
      ),
    );
  }
}
