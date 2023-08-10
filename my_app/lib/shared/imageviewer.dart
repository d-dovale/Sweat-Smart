import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  final List<String> imagePaths;
  final List<String> imageNames;

  final double arrowButtonSize;
  final double imageHeight;
  final double imageWidth;

  const ImageViewer({
    required this.imagePaths,
    required this.imageNames,
    required this.arrowButtonSize,
    required this.imageHeight,
    required this.imageWidth,
    Key? key,
  }) : super(key: key);

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
    String currentImageName = widget.imageNames[currentIndex];

    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 700),
            child: Stack(
              children: [
                Image.asset(
                  currentImagePath,
                  key: ValueKey<int>(currentIndex),
                  fit: BoxFit.contain, // Adjust the fit property
                  width: widget.imageWidth,
                  height: widget.imageHeight,
                ),
                Positioned(
                  top: 10.0,
                  left: 10.0,
                  child: Text(
                    currentImageName,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
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
                  iconSize: widget.arrowButtonSize,
                ),
                IconButton(
                  onPressed: switchToNextImage,
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.white,
                  iconSize: widget.arrowButtonSize,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
