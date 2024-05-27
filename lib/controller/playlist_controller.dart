import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/controller/player_controller.dart';
import 'package:learn_music/model/Enum/playlist.dart';
import 'package:learn_music/model/song.dart';
import 'package:learn_music/views/artist_container.dart';
import 'package:learn_music/views/genre_container.dart';

class PlaylistController extends StatelessWidget {
  final List<Song> playlist;
  final String title;
  final Playlist type;
  const PlaylistController(
      {super.key,
      required this.playlist,
      required this.title,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              topView(MediaQuery.of(context).size),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(playlist[index].title),
                          leading: Image.network(playlist[index].thumb),
                          trailing: Icon(Icons.arrow_right),
                          onTap: () {
                            final route = MaterialPageRoute(
                                builder: (context) => MyPlayerController(
                                      songToPlay: playlist[index],
                                      playlist: playlist,
                                    ));
                            Navigator.push(context, route);
                          },
                        );
                      },
                      separatorBuilder: ((context, index) => const Divider()),
                      itemCount: playlist.length))
            ],
          ),
        ),
      ),
    );
  }

  Widget topView(Size size) {
    switch (type) {
      case Playlist.artist:
        return ArtistContainer();
      case Playlist.album:
        return Container(
            child: Column(
          children: [
            Image.network(
              playlist.first.thumb,
              height: size.height / 4,
            ),
            Text(
              playlist.first.album,
              style: GoogleFonts.signika(fontSize: 25),
            ),
            Text(
              playlist.first.artist.name,
              style: GoogleFonts.signika(fontSize: 16, color: Colors.red),
            ),
          ],
        ));
      case Playlist.genre:
        return GenreContainer();
      default:
        return Container();
    }
  }
}
