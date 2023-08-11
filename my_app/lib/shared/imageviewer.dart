import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  final List<String> imagePaths;
  final List<String> imageNames;

  final double arrowButtonSize;

  const ImageViewer({
    required this.imagePaths,
    required this.imageNames,
    required this.arrowButtonSize,
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

    bool sizeOne(BuildContext context) =>
        MediaQuery.of(context).size.height <= 750;

    bool sizeTwo(BuildContext context) =>
        MediaQuery.of(context).size.height > 750;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (sizeOne(context))
                Image.asset(
                  currentImagePath,
                  key: ValueKey<int>(currentIndex),
                  fit: BoxFit.contain,
                  height: 350,
                  width: 200,
                ),
              if (sizeTwo(context))
                Image.asset(
                  currentImagePath,
                  key: ValueKey<int>(currentIndex),
                  fit: BoxFit.contain,
                  height: 450,
                  width: 250,
                ),
              // Positioned(
              //   top:
              //       10.0,
              //   child: Text(
              //     currentImageName,
              //     style: TextStyle(
              //       color: Colors.red,
              //       fontSize: 20.0,
              //       fontFamily: 'Lato',
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Row(
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
      ],
    );
  }
}
