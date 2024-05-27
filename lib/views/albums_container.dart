import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/model/album.dart';
import 'package:learn_music/services/music_handler.dart';
import 'package:learn_music/views/elements/album_view_cell.dart';

class AlbumsContainer extends StatelessWidget {

List<Album> albums = MusicHandler().allAlbums();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Albums", style: GoogleFonts.signika(fontSize: 20,),),
          Container(
            height: 300,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: albums.length,
              itemBuilder: (context, index) => AlbumViewCell(album:  albums[index])
                ),
              )
        ],
      ),
    );
  }
}