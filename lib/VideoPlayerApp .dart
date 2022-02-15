// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:flutter_youtube_view/flutter_youtube_view.dart';

// class Videopl extends StatefulWidget {
//   const Videopl({Key? key}) : super(key: key);

//   @override
//   _VideoplState createState() => _VideoplState();
// }

// class _VideoplState extends State<Videopl> {
//   @override
//   late YoutubePlayerController _controller;
//   late TextEditingController _idController;
//   late TextEditingController _seekToController;

//   late PlayerState _playerState;
//   late YoutubeMetaData _videoMetaData;
//   double _volume = 100;
//   bool _muted = false;
//   bool _isPlayerReady = false;

//   final List<String> _ids = [
//     'OXQ5ee6p9ZA',
//     'gQDByCdjUXw',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: _ids.first,
//       flags: const YoutubePlayerFlags(
//         mute: false,
//         autoPlay: true,
//         disableDragSeek: false,
//         loop: false,
//         isLive: false,
//         forceHD: false,
//         enableCaption: true,
//       ),
//     )..addListener(listener);
//     _idController = TextEditingController();
//     _seekToController = TextEditingController();
//     _videoMetaData = const YoutubeMetaData();
//     _playerState = PlayerState.unknown;
//   }

//   void listener() {
//     // if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
//     if (_isPlayerReady) {
//       setState(() {
//         _playerState = _controller.value.playerState;
//         _videoMetaData = _controller.metadata;
//       });
//     }
//   }

//   // @override
//   // void deactivate() {
//   //   // Pauses video while navigating to next page.
//   //   _controller.pause();
//   //   super.deactivate();
//   // }

//   // @override
//   // void dispose() {
//   //   _controller.dispose();
//   //   _idController.dispose();
//   //   _seekToController.dispose();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           child: const FlutterYoutubeView(
//               //  onViewCreated: _onYoutubeCreated,
//               //listener: this,
//               scaleMode: YoutubeScaleMode.none, // <option> fitWidth, fitHeight
//               params: YoutubeParam(
//                   videoId: 'OXQ5ee6p9ZA',
//                   // showUI: false,
//                   startSeconds: 0.0, // <option>
//                   autoPlay: true) // <option>
//               )),
//     );
//   }
// }
