import 'package:learn_music/model/Enum/genre.dart';
import 'package:learn_music/model/media_type.dart';
import 'package:learn_music/model/artist.dart';

class Song {
  final int id;
  final String title;
  final String album;
  final String path;
  final MediaType mediaType;
  final String thumb;
  final Genre genre;
  final Artist artist;

  Song({
    required this.id,
    required this.title,
    required this.album,
    required this.path,
    required this.mediaType,
    required this.thumb,
    required this.genre,
    required this.artist,
  });

  @override
  String toString() {
    return 'Song{id: $id, title: $title, album: $album, path: $path, mediaType: $mediaType, thumb: $thumb, genre: $genre, artist: $artist}';
  }
}