import 'package:clothestmatchandroid/CardProvider.dart';
import 'package:clothestmatchandroid/Settings.dart';
import 'package:clothestmatchandroid/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Gallery.dart';
import 'main.dart';

class InteractiveQueue extends StatefulWidget {
  const InteractiveQueue({super.key, required this.title});

  // This widget is the main interactive queue of the application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<InteractiveQueue> createState() => _InteractiveQueueState();
}

class _InteractiveQueueState extends State<InteractiveQueue>
{
  final tabs = [MyHomePage(title: "Home"), InteractiveQueue(title: "Interactive Queue"), Gallery(), Settings()];

  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: Container(alignment: Alignment.center, padding: const EdgeInsets.all(16),
    child: buildCards())),
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
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
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
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
  
  Widget buildCards()
  {
    final provider = Provider.of<CardProvider>(context, listen: true);
    final urlImages = provider.urlImages;

    if (urlImages.isNotEmpty)
    {
        return Stack
          (
          children: urlImages.map(
                  (urlImage) => ItemCard(urlImage: urlImage,
                  isFront: urlImages.last == urlImage
              )).toList(),
        );
    }
    else
    {
      return Center(child: ElevatedButton(
          onPressed: ()
          {
            final provider = Provider.of<CardProvider>(context, listen: false);
            provider.QueueItems();
            setState(() {});
          },
          child: const Text("New Queue")
      ));
    }

  }

}