import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageViewer extends StatefulWidget {
  final List<String> imagePaths;
  final List<String> imageNames;
  final double arrowButtonSize;
  final String initialSelectedImageName;

  const ImageViewer({
    required this.imagePaths,
    required this.imageNames,
    required this.arrowButtonSize,
    required this.initialSelectedImageName,
    Key? key,
  }) : super(key: key);

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  bool isLoaded = false;
  int currentIndex = 0;
  String selectedImageName = '';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    loadSelectedImageName();
    switchImage(currentIndex);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> switchImage(int newIndex) async {
    await _animationController.reverse();
    setState(() {
      currentIndex = newIndex;
      selectedImageName = widget.imageNames[currentIndex];
      saveSelectedImageName();
      saveIdealPhysique(selectedImageName);
    });
    await _animationController.forward();
  }

  Future<void> loadSelectedImageName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedImageName = prefs.getString('selectedImageName') ?? '';
    currentIndex = widget.imageNames.indexOf(selectedImageName);
    currentIndex = currentIndex.clamp(0, widget.imagePaths.length - 1);
    setState(() {
      isLoaded = true;
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
      return Container(color: Colors.transparent);
    }
    String currentImagePath = widget.imagePaths[currentIndex];

    bool sizeOne(BuildContext context) =>
        MediaQuery.of(context).size.height <= 750;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: Image.asset(
                  currentImagePath,
                  key: ValueKey<int>(currentIndex),
                  fit: BoxFit.contain,
                  height: sizeOne(context) ? 350 : 450,
                  width: sizeOne(context) ? 200 : 250,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () =>
                  switchImage((currentIndex - 1) % widget.imagePaths.length),
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: widget.arrowButtonSize,
            ),
            IconButton(
              onPressed: () =>
                  switchImage((currentIndex + 1) % widget.imagePaths.length),
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
