// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';

// class AudioPlayerWidget extends StatefulWidget {
//   final String url;

//   const AudioPlayerWidget({Key? key, required this.url}) : super(key: key);

//   @override
//   _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
// }

// class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
//   late AudioPlayer _player;
//   bool isPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     _player = AudioPlayer();
//     _player.playerStateStream.listen((state) {
//       setState(() {
//         isPlaying = state.playing;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _player.dispose();
//     super.dispose();
//   }

//   Future<void> _playPause() async {
//     if (isPlaying) {
//       await _player.pause();
//     } else {
//       await _player.setUrl(widget.url);
//       await _player.play();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
//       onPressed: _playPause,
//     );
//   }
// }
