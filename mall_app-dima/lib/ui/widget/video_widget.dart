import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AssetVideo extends StatefulWidget {
  final String videoName;
  AssetVideo({required this.videoName});
  @override
  _AssetVideoState createState() => _AssetVideoState();
}

class _AssetVideoState extends State<AssetVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/videos/${widget.videoName}');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(false);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          VideoPlayer(_controller),
        ],
      ),
    );
  }
}
