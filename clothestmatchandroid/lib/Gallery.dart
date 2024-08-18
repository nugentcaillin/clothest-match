/*Gallery view*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'Settings.dart';
import 'interactiveQueue.dart';
import 'main.dart';

class Gallery extends StatefulWidget
{
  const Gallery({super.key});


  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery>
{

  @override
  Widget build(BuildContext context)
  {
    int count = 4;

    return Scaffold(
      body: SafeArea(child: Container(
        alignment: Alignment.center, padding: const EdgeInsets.all(16),
        child: MasonryGridView.builder(
          itemCount: count,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index)
          {

            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: GetImage(index),);
          }
          ,),)),
    );
  }

  Widget GetImage(int index)
  {
    List<String> urlImages = <String>
    [
      "https://www.fancykids.com.au/cdn/shop/products/image_5ace5b94-ed01-40d8-a36a-bdc86566f67d.jpg?v=1656479284",
      "https://assemblylabel.com/cdn/shop/products/c01a596fd3cb4413bad785724b510096_600x.jpg?v=1719552555",
      "https://cottonon.com/dw/image/v2/BBDS_PRD/on/demandware.static/-/Sites-catalog-master-men/default/dwf789fe11/3611849/3611849-13-5.jpg?sw=640&sh=960&sm=fit",
      "https://m.media-amazon.com/images/I/51zdyk5qwtL._AC_SL1000_.jpg"
    ];

    return Image.network(urlImages[index]);

  }

}