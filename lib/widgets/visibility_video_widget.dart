import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class VisibilityVideoWidget extends StatefulWidget {
  VisibilityVideoWidget({
    required int seconds,
    Key? key,
  })  : _seconds = seconds,
        super(
          key: key,
        );
  int _seconds;

  @override
  State<VisibilityVideoWidget> createState() => _VisibilityVideoWidgetState();
}

class _VisibilityVideoWidgetState extends State<VisibilityVideoWidget> {
  late BetterPlayerController _betterPlayerController;
  bool _visibleVideo = false;
  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      
      BetterPlayerDataSourceType.network,
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      useAsmsSubtitles: true,
      liveStream: false,
      subtitles: [
        BetterPlayerSubtitlesSource(
            type: BetterPlayerSubtitlesSourceType.network,
            name: 'EN',
            urls: [
              'https://dl.dropboxusercontent.com/s/71nzjo2ux3evxqk/example_subtitles.srt'
            ]),
        BetterPlayerSubtitlesSource(
          type: BetterPlayerSubtitlesSourceType.network,
          name: 'DE',
          urls: [
            'https://dl.dropboxusercontent.com/s/71nzjo2ux3evxqk/example_subtitles.srt'
          ],
        ),
      ],
    );
    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(),
      betterPlayerDataSource: betterPlayerDataSource,
    );

    Future.delayed(Duration(seconds: widget._seconds), () {
      if (this.mounted) {
        setState(() {
          _visibleVideo = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainAnimation: true,
      maintainState: true,
      visible: _visibleVideo,
      child: AspectRatio(
          aspectRatio: 16 / 9,
          child: BetterPlayer(
            controller: _betterPlayerController,
          )),
    );
  }
}
