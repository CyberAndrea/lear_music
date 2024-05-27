import 'package:learn_music/model/artist.dart';
import 'package:learn_music/model/song.dart';

class Album{
  String title;
  Artist artist;
  List<Song> songs;

  Album({required this.title, required this.artist, required this.songs});
}