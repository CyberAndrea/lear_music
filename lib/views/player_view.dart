import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/model/song.dart';

class PlayerView extends StatelessWidget {
  final Song song;
  final EdgeInsets padding = const EdgeInsets.all(8.0);
  final Container spacer = Container(width: 10);
  final Color bg = Color.fromRGBO(
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
  final Duration position;
  final Duration maxDuration;
  final bool shuffle;
  final bool repeat;

  final Function() onRepeatPressed;
  final Function() onShufflePressed;
  final Function() onPlayPausePressed;
  final Function() onRewindPressed;
  final Function() onForwardPressed;
  final Function(double) onPositionChange;
  final IconData playPauseIcon;

  PlayerView(
      {super.key,
      required this.song,
      required this.onRepeatPressed,
      required this.onShufflePressed,
      required this.onPlayPausePressed,
      required this.onRewindPressed,
      required this.onForwardPressed,
      required this.maxDuration,
      required this.position,
      required this.onPositionChange,
      required this.shuffle,
      required this.repeat,
      required this.playPauseIcon
      });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: bg,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            song.title,
            style: GoogleFonts.signika(fontSize: 34),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  child: Image.network(song.thumb,
                      fit: BoxFit.fill, height: size.width / 2)),
              const Divider(thickness: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.ios_share),
                  spacer,
                  const Icon(Icons.menu),
                  spacer,
                  const Icon(Icons.whatshot)
                ],
              ),
              Text(song.artist.name,
                  style: GoogleFonts.signika(
                      fontSize: 35, color: Colors.redAccent)),
              Text(song.title,
                  style: GoogleFonts.signika(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              Card(
                child: Container(
                  color: bg.withOpacity(0.55),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            onPressed: onRepeatPressed,
                            icon:
                                Icon((repeat) ? Icons.repeat_on : Icons.repeat),
                            color: Colors.white,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: onRewindPressed,
                                    icon: const Icon(Icons.fast_rewind)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: onPlayPausePressed,
                                    icon:  Icon(playPauseIcon)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: onForwardPressed,
                                    icon: const Icon(Icons.fast_forward)),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: onShufflePressed,
                              icon: Icon(
                                  (shuffle) ? Icons.shuffle_on : Icons.shuffle))
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(0.toString(),
                                  style: GoogleFonts.signika(
                                      fontSize: 18, color: Colors.red)),
                              Text(position.inSeconds.toString(),
                                  style: GoogleFonts.signika(
                                      fontSize: 18, color: Colors.red)),
                              Text(maxDuration.inSeconds.toString(),
                                  style: GoogleFonts.signika(
                                      fontSize: 18, color: Colors.red)),
                            ],
                          ),
                          Slider(
                            min: 0,
                            max: maxDuration.inSeconds.toDouble(),
                            value: position.inSeconds.toDouble(),
                            onChanged: onPositionChange,
                            thumbColor: Colors.red,
                            activeColor: Colors.white,
                            inactiveColor: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.speaker),
                  spacer,
                  const Icon(Icons.timer),
                  spacer,
                  const Icon(Icons.whatshot_outlined)
                ],
              ),
            ],
          ),
        ));
  }
}
