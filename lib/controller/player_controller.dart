import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learn_music/model/media_type.dart';
import 'package:learn_music/model/song.dart';
import 'package:learn_music/views/player_view.dart';

class MyPlayerController extends StatefulWidget {
  final Song songToPlay;
  final List<Song> playlist;
  const MyPlayerController(
      {Key? key, required this.songToPlay, required this.playlist})
      : super(key: key);
  @override
  MyPlayerControllerState createState() => MyPlayerControllerState();
}

class MyPlayerControllerState extends State<MyPlayerController> {
  late Song song;
  late AudioPlayer audioPlayer;
  AudioCache? audioCache;
  Duration position = const Duration(seconds: 0);
  Duration maxDuration = const Duration(seconds: 0);
  bool playShuffle = false;
  bool repeat = false;
  IconData iconData = Icons.play_circle;

  @override
  void initState() {
    super.initState();
    song = widget.songToPlay;
    setupPlayer();
  }

  @override
  void dispose() {
    clearPlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PlayerView(
        song: song,
        onRepeatPressed: onRepeatPressed,
        onShufflePressed: onShufflePressed,
        onForwardPressed: onForwardPressed,
        onPlayPausePressed: onPlayPausePressed,
        onRewindPressed: onRewindPressed,
        onPositionChange: onPositionChange,
        maxDuration: maxDuration,
        position: position,
        repeat: repeat,
        shuffle: playShuffle,
        playPauseIcon: iconData,
      );

  onPositionChange(double newPosition) {}

  onPlayPausePressed() async {
    final state = audioPlayer.state;
    switch (state) {
      case PlayerState.paused:
        await audioPlayer.resume();
        break;
      case PlayerState.playing:
        audioPlayer.pause();
        break;
      case PlayerState.stopped:
        setupPlayer();
        break;
      case PlayerState.completed:
        onForwardPressed();
        audioPlayer.seek(Duration.zero);
        audioPlayer.resume();
        break;
      default:
        break;
    }
  }

  onRewindPressed() {}
  onForwardPressed() {}
  onRepeatPressed() {
    setState(() {
      repeat = !repeat;
    });
  }

  onShufflePressed() {
    setState(() {
      playShuffle = !playShuffle;
    });
  }

  Future pathForInAppAudio() async {
    audioCache = AudioCache();
    String string = "";
    if (audioCache != null) {
      final uri = await audioCache!.load(song.path);
      string = uri.toString();
    } else {
      string = "";
    }

    return string;
  }

  onStateChange(PlayerState state) {
    setState(() {
      switch (state) {
        case PlayerState.paused:
          iconData = Icons.play_circle;
          break;
        case PlayerState.playing:
          iconData = Icons.pause_circle;
          break;
        case PlayerState.stopped:
          iconData = Icons.play_circle;
          break;
        case PlayerState.completed:
          break;
        default:
          break;
      }
    });
  }

  setupPlayer() async {
    try {
      audioPlayer = AudioPlayer();
      audioPlayer.onPlayerStateChanged.listen(onStateChange);

      final url = (song.mediaType == MediaType.internet)
          ? UrlSource(song.path)
          : await pathForInAppAudio();

      await audioPlayer.play(url);
    } catch (e) {
      print(e.toString());
    }
  }

 

  clearPlayer() {
    audioPlayer.stop();
    audioPlayer.dispose();
    if (audioCache != null) {
      audioCache?.clearAll();
    }
    audioCache = null;
  }
}
