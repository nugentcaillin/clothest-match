import 'dart:math';

import 'package:clothestmatchandroid/CardProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatefulWidget
{
  final String urlImage;
  final bool isFront;

  const ItemCard({Key? key,
    required this.urlImage,
    required this.isFront,
  }) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard>
{
  void initState ()
  {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_)
    {
      final size = MediaQuery.of(context).size;

      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) => SizedBox.expand(
    child: widget.isFront ? buildFrontCard() : buildCard(),
  );

  Widget buildFrontCard() => GestureDetector(
    child: LayoutBuilder(builder: (context, constraints)
    {
      // Animating card dragging and communicating with provider
      final provider = Provider.of<CardProvider>(context, listen: true);
      final position = provider.position;
      final milliseconds = provider.isDragging ? 0 :400;

      final center = constraints.smallest.center(Offset.zero);
      final angle = provider.angle * pi / 180;
      final rotatedMatrix = Matrix4.identity()
        ..translate(center.dx, center.dy)
        ..rotateZ(angle)
        .. translate(-center.dx, -center.dy);

      return AnimatedContainer(duration: Duration(milliseconds: milliseconds),
                                curve: Curves.easeInOut,
                                transform: rotatedMatrix..translate(position.dx, position.dy),
                                child: buildCard(),);
    }),
    onPanStart: (details)
    {
      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.startPosition(details);
    },
    onPanUpdate: (details)
    {
      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.updatePosition(details);
    },
    onPanEnd: (details)
    {
      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.endPosition();
    },
  );

  Widget buildCard() => ClipRRect(borderRadius: BorderRadius.circular(20), child: Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage(widget.urlImage),
      fit: BoxFit.cover,
      alignment: Alignment(-0.3, 0))
    ),
  ));
}