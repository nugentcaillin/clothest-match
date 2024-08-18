/*Gallery view*/
import 'package:clothestmatchandroid/Backend_api.dart';
import 'package:flutter/material.dart' as FM;
import 'package:clothestmatchandroid/Card.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'Settings.dart';
import 'interactiveQueue.dart';
import 'main.dart';

class Gallery extends FM.StatelessWidget
{

  Future<List<Card>?> GetCards() async
  {
    BackendApi api = new BackendApi();
    if (api.hasSessionID())
    {
      List<Card> response =  (await api.GetProductsForGallery()).cast<Card>();
      return response;
    }
    else
    {
      return null;
    }
  }

  FM.Widget GetImage(int index, List<Card> cards)
  {
    return FM.Image.network(cards[index].url);

  }

  FM.Widget GetMainGallery(FM.AsyncSnapshot snapshot)
  {
    if (snapshot.hasData)
    {
      List<Card> cards = snapshot.data;
      return FM.Scaffold(
        body: FM.SafeArea(child: FM.Container(
          alignment: FM.Alignment.center, padding: const FM.EdgeInsets.all(16),
          child: MasonryGridView.builder(
            itemCount: cards.length,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index)
            {

              return FM.Padding(
                padding: const FM.EdgeInsets.all(2.0),
                child: GetImage(index, cards),);
            }
            ,),)),
      );
    }
    else
    {
      return FM.Scaffold(
          body: FM.SafeArea(child: FM.Container(
              alignment: FM.Alignment.center, padding: const FM.EdgeInsets.all(16),
              child: FM.Text("Swipe for items to view gallery!"))));
    }
  }

  @override
  FM.Widget build(context) {
    return FM.FutureBuilder<List<Card>?>(
        future: GetCards(),
        builder: (context, FM.AsyncSnapshot<List<Card>?> snapshot) {
          if (snapshot.hasData) {
            return GetMainGallery(snapshot);
          } else {
            return FM.CircularProgressIndicator();
          }
        }
    );
  }
}