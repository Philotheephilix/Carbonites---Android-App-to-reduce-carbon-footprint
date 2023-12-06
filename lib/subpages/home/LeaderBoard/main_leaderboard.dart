import 'package:flutter/material.dart';

import '../../../models/rank_ladder.dart';

class MainLeaderBoardPage extends StatelessWidget {
  const MainLeaderBoardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        const PodiumWidget(),
        RankLadder(candidateNames: _candidateNames()),
        Container(
          height: 60,
          color: Colors.transparent,
          padding: const EdgeInsets.only(right: 20),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Swipe >',
                style: TextStyle(
                  fontFamily: 'Capriola',
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PodiumWidget extends StatelessWidget {
  const PodiumWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      color: Colors.transparent,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularPictureFrame(
                topPadding: 100.0,
                bottomPadding: 0.0,
                profileImage: 'assets/profile_folder/png1.jpeg',
                badgeImage: 'assets/images/badge2.png',
              ),
              CircularPictureFrame(
                topPadding: 0.0,
                bottomPadding: 100.0,
                profileImage: 'assets/profile_folder/png2.jpeg',
                badgeImage: 'assets/images/badge1.png',
              ),
              CircularPictureFrame(
                topPadding: 100.0,
                bottomPadding: 0.0,
                profileImage: 'assets/profile_folder/png3.jpeg',
                badgeImage: 'assets/images/badge3.png',
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Congrats! You placed 1st!',
            style: TextStyle(
              fontFamily: 'Capriola',
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class CircularPictureFrame extends StatelessWidget {
  const CircularPictureFrame({
    super.key,
    required this.topPadding,
    required this.bottomPadding,
    required this.profileImage,
    required this.badgeImage,
  });

  final double topPadding;
  final double bottomPadding;
  final String profileImage;
  final String badgeImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(profileImage),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  width: 40,
                  height: 40,
                  color: Colors.transparent,
                  child: Image.asset(
                    badgeImage,
                  ),
                ),
              ),
            ],
          ),
          const Text(
            'score',
            style: TextStyle(
              fontFamily: 'Capriola',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

List<List<String>> _candidateNames() {
  List<List<String>> names = [
    ['A', '2000 pts'],
    ['B', '1500 pts'],
    ['C', '1000 pts'],
    ['D', '500 pts'],
    ['E', '250 pts'],
    ['A', '2000 pts'],
    ['B', '1500 pts'],
    ['C', '1000 pts'],
    ['D', '500 pts'],
    ['E', '250 pts']
  ];
  return names;
}
