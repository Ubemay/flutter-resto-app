import 'package:audioplayers/audioplayers.dart';

class MusicPlayer {
  static AudioPlayer player = AudioPlayer();
  static bool isPlaying = false;

  static void toggle() {
    if (isPlaying) {
      player.pause();
    } else {
      player.play('https://zvukipro.com/uploads/files/2020-01/1579425984_barradeen-the-girl-i-havent-met.mp3');
    }
    isPlaying = !isPlaying;
  }
}
