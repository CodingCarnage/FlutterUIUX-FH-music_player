import 'package:flutter/material.dart';
import 'package:music_player/src/helpers/helpers.dart';

import 'package:music_player/src/widgets/custom_app_bar_widget.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(),
          ImageAlbumDuration(),
          TitlePlay(),
          Expanded(child: Lyrics()),
        ],
      ),
    );
  }
}

class Lyrics extends StatelessWidget {
  const Lyrics({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> lyrics = getLyrics();
    return Container(
      child: ListWheelScrollView(
        itemExtent: 42,
        diameterRatio: 1.5,
        physics: BouncingScrollPhysics(),
        children: lyrics.map(
          (line) => Text(
            line,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ).toList(),
      ),
    );
  }
}

class TitlePlay extends StatelessWidget {
  const TitlePlay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      margin: const EdgeInsets.only(top: 40.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'Far Away',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Text(
                '-Breaking Benjamin-',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
          Spacer(),
          FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: Color(0xffF8CB51),
            child: Icon(Icons.play_arrow),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class ImageAlbumDuration extends StatelessWidget {
  const ImageAlbumDuration({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      margin: const EdgeInsets.only(top: 70),
      child: Row(
        children: <Widget>[
          ImageAlbum(),
          SizedBox(width: 27.5),
          MusicProgressBar(),
          SizedBox(width: 20.0),
        ],
      ),
    );
  }
}

class MusicProgressBar extends StatelessWidget {
  const MusicProgressBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '00:00',
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          const SizedBox(height: 10.0),
          Stack(
            children: <Widget>[
              Container(
                width: 3,
                height: 230,
                color: Colors.white.withOpacity(0.1),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 3,
                  height: 150,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Text(
            '00:00',
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageAlbum extends StatelessWidget {
  const ImageAlbum({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: 250.0,
      height: 250.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/aurora.jpg'),
            ),
            Container(
              width: 25.0,
              height: 25.0,
              decoration: BoxDecoration(
                color: Colors.black38,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 18.0,
              height: 18.0,
              decoration: BoxDecoration(
                color: Color(0xff1C1C25),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff484750),
            Color(0xff1E1C24),
          ],
        ),
      ),
    );
  }
}
