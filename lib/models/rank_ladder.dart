import 'package:flutter/material.dart';

class RankLadder extends StatelessWidget {
  const RankLadder({
    super.key,
    required this.candidateNames,
  });

  final List<List<String>> candidateNames;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: const Color(0xFF52B69A),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: _generateElements(candidateNames),
        ),
      ),
    );
  }

  List<Widget> _generateElements(List<List<String>> names) {
    List<Widget> elements = [];

    for (int i = 0; i < names.length; ++i) {
      elements.add(_element(names[i]));
      elements.add(const SizedBox(
        height: 10.0,
      ));
    }
    return elements;
  }

  Container _element(List<String> name) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF93DB85),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(name[0]),
          Text(name[1]),
        ],
      ),
    );
  }
}
