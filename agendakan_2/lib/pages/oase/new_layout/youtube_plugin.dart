// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';

// class YoutubeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Agendakan.com X Signature',
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         primarySwatch: Colors.deepPurple,
//         scaffoldBackgroundColor: Colors.black,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: YoutubeAppDemo(),
//     );
//   }
// }

// ///
// class YoutubeAppDemo extends StatefulWidget {
//   @override
//   _YoutubeAppDemoState createState() => _YoutubeAppDemoState();
// }

// class _YoutubeAppDemoState extends State<YoutubeAppDemo> {
//   late YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: 'tcodrIK2P_I',
//       params: const YoutubePlayerParams(
//         playlist: ['4Wrc4fHSCpw'],
//         startAt: const Duration(minutes: 1, seconds: 36),
//         showControls: true,
//         showFullscreenButton: true,
//         desktopMode: false,
//         privacyEnhanced: true,
//         useHybridComposition: true,
//       ),
//     );
//     _controller.onEnterFullscreen = () {
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//       print('Entered Fullscreen');
//     };
//     _controller.onExitFullscreen = () {
//       print('Exited Fullscreen');
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     //const player = YoutubePlayerIFrame();
//     return YoutubePlayerIFrame(
//       controller: _controller,
//       aspectRatio: 16 / 9,
//     );
//     // return YoutubePlayerControllerProvider(
//     //   // Passing controller to widgets below.
//     //   controller: _controller,
//     //   child: Scaffold(
//     //     body: LayoutBuilder(
//     //       builder: (context, constraints) {
//     //         if (kIsWeb && constraints.maxWidth > 800) {
//     //           return Row(
//     //             crossAxisAlignment: CrossAxisAlignment.start,
//     //             children: [
//     //               const Expanded(child: player),
//     //             ],
//     //           );
//     //         }
//     //         return ListView(
//     //           children: [
//     //             Stack(
//     //               children: [
//     //                 player,
//     //                 Positioned.fill(
//     //                   child: YoutubeValueBuilder(
//     //                     controller: _controller,
//     //                     builder: (context, value) {
//     //                       return AnimatedCrossFade(
//     //                         firstChild: const SizedBox.shrink(),
//     //                         secondChild: Container(
//     //                           child: DecoratedBox(
//     //                             decoration: BoxDecoration(
//     //                               image: DecorationImage(
//     //                                 image: NetworkImage(
//     //                                   YoutubePlayerController.getThumbnail(
//     //                                     videoId:
//     //                                         _controller.params.playlist.first,
//     //                                     quality: ThumbnailQuality.medium,
//     //                                   ),
//     //                                 ),
//     //                                 fit: BoxFit.fitWidth,
//     //                               ),
//     //                             ),
//     //                             child: const Center(
//     //                               child: CircularProgressIndicator(),
//     //                             ),
//     //                           ),
//     //                         ),
//     //                         crossFadeState: value.isReady
//     //                             ? CrossFadeState.showFirst
//     //                             : CrossFadeState.showSecond,
//     //                         duration: const Duration(milliseconds: 300),
//     //                       );
//     //                     },
//     //                   ),
//     //                 ),
//     //               ],
//     //             ),
//     //           ],
//     //         );
//     //       },
//     //     ),
//     //   ),
//     // );
//   }

//   @override
//   void dispose() {
//     _controller.close();
//     super.dispose();
//   }
// }

// ///
// class Controls extends StatelessWidget {
//   ///
//   const Controls();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _space,
//           // MetaDataSection(),
//           // _space,
//           // SourceInputSection(),
//           // _space,
//           // PlayPauseButtonBar(),
//           // _space,
//           // VolumeSlider(),
//           // _space,
//           // PlayerStateSection(),
//         ],
//       ),
//     );
//   }

//   Widget get _space => const SizedBox(height: 10);
// }
