import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageViewer extends StatefulWidget {
  final List<String> imagePaths;
  final List<String> imageNames;
  final double arrowButtonSize;
  final String initialSelectedImageName; // Add this

  const ImageViewer({
    required this.imagePaths,
    required this.imageNames,
    required this.arrowButtonSize,
    required this.initialSelectedImageName, // Add this
    Key? key,
  }) : super(key: key);

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  bool isLoaded = false;
  int currentIndex = 0; // Track the current image index
  String selectedImageName = ''; // Track the selected image name

  void initState() {
    super.initState();
    loadSelectedImageName(); // Load the selected image name from SharedPreferences
  }

  Future<void> loadSelectedImageName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedImageName = prefs.getString('selectedImageName') ?? '';
    // Find the index of the loaded image name in imageNames and update currentIndex
    currentIndex = widget.imageNames.indexOf(selectedImageName);
    currentIndex = currentIndex.clamp(0, widget.imagePaths.length - 1);
    setState(() {
      isLoaded = true;
    });
  }

  void switchToPreviousImage() {
    setState(() {
      currentIndex = (currentIndex - 1) % widget.imagePaths.length;
      selectedImageName = widget.imageNames[currentIndex];
      saveSelectedImageName(); // Save the selected image name
      saveIdealPhysique(selectedImageName);
    });
  }

  void switchToNextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.imagePaths.length;
      selectedImageName = widget.imageNames[currentIndex];
      saveSelectedImageName(); // Save the selected image name
      saveIdealPhysique(selectedImageName);
    });
  }

  void saveIdealPhysique(String idealPhysique) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('idealPhysique', idealPhysique);
  }

  Future<void> saveSelectedImageName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedImageName', selectedImageName);
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return Container(
          color: Colors.transparent); // Or any loading indicator widget
    }
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
            alignment: Alignment.topCenter,
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
