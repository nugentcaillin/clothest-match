import 'package:flutter/cupertino.dart';

// Each card being dragged around, the details of the interaction
// ends up here
class CardProvider extends ChangeNotifier
{
  bool _isDragging = false;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;
  double _angle = 0;

  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;

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
    resetPosition();
  }

  void resetPosition()
  {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;

    notifyListeners();
  }
}