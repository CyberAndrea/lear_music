import 'package:flutter/material.dart';
import 'package:learn_music/model/Enum/genre.dart';
import 'package:learn_music/services/music_handler.dart';
import 'package:learn_music/views/elements/genre_card_cell.dart';

class GenreContainer extends StatelessWidget {
  final List<Genre> genres = MusicHandler().allGenres();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Genres',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 75,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: genres.length,
                itemBuilder: ((context, index) =>
                    GenreCardCell(genre: genres[index]))),
          )
        ],
      ),
    );
  }
}
