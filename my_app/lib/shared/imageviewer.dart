import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  final List<String> imagePaths;

  const ImageViewer({required this.imagePaths, Key? key}) : super(key: key);

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int currentIndex = 0; // Track the current image index

  void switchToPreviousImage() {
    setState(() {
      currentIndex = (currentIndex - 1) % widget.imagePaths.length;
    });
  }

  void switchToNextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.imagePaths.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentImagePath = widget.imagePaths[currentIndex];

    // Calculate padding based on screen size
    double screenHeight = MediaQuery.of(context).size.height;
    double paddingValue = screenHeight * 0.1;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, paddingValue, 20.0, 0.0),
          child: AspectRatio(
            aspectRatio: 0.7,
            child: Image.asset(
              currentImagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: switchToPreviousImage,
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
              ),
              IconButton(
                onPressed: switchToNextImage,
                icon: Icon(Icons.arrow_forward),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
