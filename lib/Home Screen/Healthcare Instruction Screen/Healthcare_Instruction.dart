import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Healthcare extends StatefulWidget {
  const Healthcare({Key? key}) : super(key: key);

  @override
  State<Healthcare> createState() => _HealthcareState();
}

class _HealthcareState extends State<Healthcare> {
  late VideoPlayerController _controller;
  bool _isVideoPlaying = false;

  // Sample list of items: images and video URLs
  final List<Map<String, String>> mediaItems = [
    {'type': 'image', 'url': 'assets/one.jpg'},
    {'type': 'image', 'url': 'https://via.placeholder.com/150'},
    {'type': 'video', 'url': 'https://www.w3schools.com/html/mov_bbb.mp4'},
    {'type': 'image', 'url': 'https://via.placeholder.com/150'},
    {'type': 'video', 'url': 'https://www.w3schools.com/html/mov_bbb.mp4'},
  ];

  @override
  void initState() {
    super.initState();
    // Initialize the video player controller
    _controller = VideoPlayerController.network(mediaItems[2]['url']!)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Healthcare Instruction"),
      ),
      body: ListView.builder(
        itemCount: mediaItems.length,
        itemBuilder: (context, index) {
          final item = mediaItems[index];

          if (item['type'] == 'image') {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                item['url']!,
                fit: BoxFit.cover,
              ),
            );
          } else if (item['type'] == 'video') {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isVideoPlaying = !_isVideoPlaying;
                    if (_isVideoPlaying) {
                      _controller.play();
                    } else {
                      _controller.pause();
                    }
                  });
                },
                child: Column(
                  children: [
                    _isVideoPlaying
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                        : Container(
                            width: double.infinity,
                            height: 200,
                            color: Colors.black,
                            child: const Center(
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),
                    const SizedBox(height: 8),
                    Text("Video ${index + 1}"),
                  ],
                ),
              ),
            );
          }
          return const SizedBox(); // For cases when type is invalid
        },
      ),
    );
  }
}
