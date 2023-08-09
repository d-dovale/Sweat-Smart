import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  final List<String> imagePaths;
  final List<String> imageNames; // Add a list of image names

  const ImageViewer(
      {required this.imagePaths, required this.imageNames, Key? key})
      : super(key: key);

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
    String currentImageName =
        widget.imageNames[currentIndex]; // Get the current image name

    // Calculate padding based on screen size
    double screenHeight = MediaQuery.of(context).size.height;
    double paddingValue = screenHeight * 0.07;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double availableWidth = constraints.maxWidth;
        double availableHeight = constraints.maxHeight;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, paddingValue, 20.0, 0.0),
              child: AspectRatio(
                aspectRatio: 0.7,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 700),
                  child: Stack(
                    children: [
                      Image.asset(
                        currentImagePath,
                        key: ValueKey<int>(currentIndex),
                        fit: BoxFit.cover,
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
      },
    );
  }
}
