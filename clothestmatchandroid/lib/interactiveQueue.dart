import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CardProvider.dart';
import 'item_card.dart';
import "package:flutter/scheduler.dart";

class InteractiveQueue extends StatefulWidget
{
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
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: Container(alignment: Alignment.center, padding: const EdgeInsets.all(16),
        child: buildCards())),
  );

  Widget buildCards()
  {
    final provider = Provider.of<CardProvider>(context, listen: true);
    final urlImages = provider.urlImages;
    final cards = provider.cards;

    if (cards.isNotEmpty)
    {
      return Stack
        (
        children: cards.map(
                (card) => ItemCard(urlImage: card.url,
                isFront: cards.last == card
            )).toList(),
      );
    }
    else
    {
      return Center(child: ElevatedButton(
          onPressed: () async
          {
            final provider = Provider.of<CardProvider>(context, listen: false);
            await provider.QueueItems();
            SchedulerBinding.instance.addPostFrameCallback((_)
            {
              setState(() {});
            });
          },
          child: const Text("New Queue")
      ));
    }

  }

}