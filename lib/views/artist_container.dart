import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/model/artist.dart';
import 'package:learn_music/services/music_handler.dart';
import 'package:learn_music/views/elements/artist_circle_cell.dart';

class ArtistContainer extends StatelessWidget {

final List<Artist> artists = MusicHandler().allArtist();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
              Text('Artistes', style: GoogleFonts.signika(fontSize: 20, fontWeight: FontWeight.bold),),
              Container(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: artists.length,
                  itemBuilder: ((context,index) =>  ArtistCircleCell(artist: artists[index], height: 75) )
                  ),
              )

          ],

      ),
    );
  }
}
