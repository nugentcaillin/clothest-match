/*Gallery view*/
import 'package:flutter/material.dart';

import 'interactiveQueue.dart';
import 'main.dart';

class Gallery extends StatefulWidget
{
  const Gallery({super.key});


  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery>
{
  final tabs = [MyHomePage(title: "Home"), InteractiveQueue(title: "Interactive Queue"), Gallery()];

  int currentPageIndex = 2;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: Container(alignment: Alignment.center, padding: const EdgeInsets.all(16),
    child: const Text("Welcome to the gallery"),)),
    bottomNavigationBar: BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_sharp),
          label: 'Interactive Queue',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder_special),
          label: 'Gallery',
        ),
      ],
      onTap: (index) {
        setState(() {
          currentPageIndex = index;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => tabs[currentPageIndex]),
          );
        });
      },
    ),
  );
}