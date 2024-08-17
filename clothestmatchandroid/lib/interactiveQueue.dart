import 'package:clothestmatchandroid/item_card.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: Container(alignment: Alignment.center, padding: const EdgeInsets.all(16),
    child: ItemCard(urlImage: "https://m.media-amazon.com/images/I/61RSyB+kbzL._AC_SL1200_.jpg"),))
  );


}