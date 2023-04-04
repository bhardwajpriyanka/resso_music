import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resso_music/screen/home/provider/home_provider.dart';
import 'package:resso_music/screen/home/view/home_screen.dart';
import 'package:resso_music/screen/music/view/music2_screen.dart';
import 'package:resso_music/screen/music/view/music_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Homeprovider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => homescreen(),
          'Music' : (context) => Musicscreen(),
          'Music2' : (context) =>music2(),

        },
      ),
    ),
  );
}
