/*Gallery view*/
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: Container(alignment: Alignment.center, padding: const EdgeInsets.all(16),
    child: const Text("Welcome to the gallery"),)),
  );
}