import 'package:flutter/material.dart';

class RankDisplayWidget extends StatefulWidget {
  const RankDisplayWidget({super.key});

  @override
  State<RankDisplayWidget> createState() => _RankDisplayWidgetState();
}

class _RankDisplayWidgetState extends State<RankDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 2.0,
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white70.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // max height is 140 so do calculations accordingly
                    RankDisplayElement(
                      height: 100,
                      color: Colors.orange,
                      image: 'png1.jpeg',
                    ),
                    RankDisplayElement(
                      height: 120,
                      color: Colors.blue,
                      image: 'png2.jpeg',
                    ),
                    RankDisplayElement(
                      height: 90,
                      color: Colors.green,
                      image: 'png3.jpeg',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.all(15),
            child: const Text(
              'You placed in !',
              style: TextStyle(
                fontFamily: 'Capriola',
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RankDisplayElement extends StatelessWidget {
  const RankDisplayElement({
    super.key,
    required this.height,
    required this.color,
    required this.image,
  });

  final double height;
  final Color color;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 200 - height - 60,
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage( 'assets/profile_folder/$image'),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: height,
          width: 50,
          color: color,
        ),
      ],
    );
  }
}
