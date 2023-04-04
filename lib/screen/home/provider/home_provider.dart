import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

  int song=0;

class Homeprovider extends ChangeNotifier {
  AssetsAudioPlayer? assetsAudioPlayer;
  bool ismute = false;
  bool icon = false;

  List artist = [
    "assets/images/badshah.jpg",
    "assets/images/neha.jpg",
    "assets/images/arjit singh.jpg",
    "assets/images/arman malik.jpg",
  ];

  List artname = [
    "Badshah",
    "Neha kakkar",
    "Arijit sing",
    "arman malik",
  ];

  List artsub = [
    "Rapper",
    "Singer",
    "Singer",
    "Singer",
  ];

  List<Audio> songg = [
    Audio("assets/audio/Maan.mp3"),
    Audio("assets/audio/Apna-Bana-Le.mp3"),
    Audio("assets/audio/Company.mp3"),
    Audio("assets/audio/Ek-Din-Pyar.mp3"),
    Audio("assets/audio/WOH.mp3"),
    Audio("assets/audio/Lehanga.mp3"),
  ];

  List immg = [
    "assets/images/maan.jpg",
    "assets/images/apna.jpg",
    "assets/images/company.jpg",
    "assets/images/Ek din pyar.jpg",
    "assets/images/woh.jpg",
    "assets/images/lehnga.jpg",
  ];

  List naam = [
    "Mann Meri Jaan",
    "Apna bana le..",
    "Comapny",
    "Ek din pyar",
    "Woh",
    "Lehnga",
  ];

  List subnaam = [
    "king",
    "arijit sing",
    "Emiway bantai",
    "Mc stan",
    "ikka | dino",
    "Jass manek",
  ];

  void initaudio() {
    assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer!.open(Playlist(audios: songg),
        autoStart: false, showNotification: true);

  }

  Future<void> playmusic() async {
    await assetsAudioPlayer!.play();
  }

  Future<void> muteorunmute() async {
    await assetsAudioPlayer!.setVolume(ismute ? 1 : 0);
    ismute = !ismute;
    notifyListeners();
  }

  void playAudio()
  {
    assetsAudioPlayer!.play();
  }
  void pauseAudio()
  {
    assetsAudioPlayer!.pause();
  }


  Future<void> nextsong() async {
    icon = true;
    await assetsAudioPlayer!.next();
    notifyListeners();
  }
  Future<void> previoussong() async {
    icon = true;
    await assetsAudioPlayer!.previous();
    notifyListeners();
  }
  int i=0;

  void nextimg()
  {
    i++;
    notifyListeners();
  }
  void preimg()
  {
    i--;
    notifyListeners();
  }

}