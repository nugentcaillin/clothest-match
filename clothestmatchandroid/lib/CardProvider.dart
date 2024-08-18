import 'package:clothestmatchandroid/Card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as FM ;
import 'package:fluttertoast/fluttertoast.dart';

import 'Backend_api.dart';

enum CardStatus {like, dislike, checkForInfo}

// Each card being dragged around, the details of the interaction
// ends up here
class CardProvider extends ChangeNotifier
{
  List<String> _urlImages = [];
  List<Card> _cards = [];

  bool _isDragging = false;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;
  double _angle = 0;

  List<String> get urlImages => _urlImages;
  List<Card> get cards => _cards;
  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;

  BackendApi backendApi = BackendApi();

  CardProvider()
  {
    QueueItems();
  }

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  void startPosition(DragStartDetails details)
  {
    _isDragging = true;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details)
  {
    _position += details.delta;

    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;

    notifyListeners();
  }

  void endPosition()
  {
    _isDragging = false;
    notifyListeners();

    final status = getStatus();

    if (status != null)
    {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
        msg: status.toString().split('.').last.toUpperCase(),
        fontSize: 36,
      );
    }

    switch (status)
    {
      case CardStatus.like:
        like();
        break;
      case CardStatus.dislike:
        dislike();
      default:
        resetPosition();
    }

  }

  void resetPosition()
  {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;

    notifyListeners();
  }

  CardStatus? getStatus()
  {
    final x = _position.dx;
    final y = _position.dy;
    final delta = 120;

    if (x >= delta)
    {
      return CardStatus.like;
    }
    else if (x <= -delta)
    {
      return CardStatus.dislike;
    }
    else if (y <= -delta/2)
    {
      return CardStatus.checkForInfo;
    }

    return null;
  }

  void like()
  {
    _angle = 20;
    _position += Offset(2 * _screenSize.width / 2, 0);
    backendApi.swipeRight(cards.last);
    _nextCard();
    if (_cards.length < 2) QueueItems();

    notifyListeners();
  }

  void dislike()
  {
    _angle = -20;
    _position += Offset(-2 * _screenSize.width / 2, 0);
    backendApi.swipeLeft(cards.last);
    _nextCard();

    if (_cards.length < 2) QueueItems();

    notifyListeners();
  }

  void showDetails(context)
  {
    _angle = 0;
    _position = Offset.zero;
    Card tmp = cards.last;
    FM.showDialog(context: context, builder: (context) => FM.AlertDialog(
      title: Text(tmp.getId().toString()),
      content: Text(tmp.getUrl()),
      actions: [
        FM.TextButton(
            onPressed: ()=>FM.Navigator.pop(context),
            child: const Text("Close"))
      ],
    ));
  }

  Future _nextCard() async
  {
    if (_cards.isEmpty) return;

    await Future.delayed(const Duration(milliseconds: 200));
    _cards.removeLast();
    resetPosition();
  }

  Future<void> QueueItems() async
  {
    final response = await backendApi.GetProducts();

    print("CARDS BEFORE STATE");
    print(_cards);

    if (_cards.isNotEmpty) {
      Card tmp = response.last;
      response.last = cards.last;
      cards.last = tmp;
      _cards = _cards + response;
    } else {
      _cards = response;
    }

    print("RESPONSE");
    print(response);

    print("CARD STATE");
    print(_cards);

    // Placeholder
    _urlImages = <String>
    [
      "https://www.fancykids.com.au/cdn/shop/products/image_5ace5b94-ed01-40d8-a36a-bdc86566f67d.jpg?v=1656479284",
      "https://assemblylabel.com/cdn/shop/products/c01a596fd3cb4413bad785724b510096_600x.jpg?v=1719552555",
      "https://cottonon.com/dw/image/v2/BBDS_PRD/on/demandware.static/-/Sites-catalog-master-men/default/dwf789fe11/3611849/3611849-13-5.jpg?sw=640&sh=960&sm=fit",
      "https://m.media-amazon.com/images/I/51zdyk5qwtL._AC_SL1000_.jpg"
    ].reversed.toList();
  }
}