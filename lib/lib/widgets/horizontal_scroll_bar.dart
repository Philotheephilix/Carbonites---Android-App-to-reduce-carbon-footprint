import 'package:flutter/material.dart';

class HorizontalScrollBar extends StatelessWidget {
  const HorizontalScrollBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 415,
      height: 180,
      color: Colors.green,
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent, //const Color(0xffEC9EFC),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: const Center(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Highlights',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 415,
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                        color: const Color(0xffEC9EFC),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(
                    width: 10,
                    height: 100,
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                        color: const Color(0xffEC9EFC),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(
                    width: 10,
                    height: 100,
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                        color: const Color(0xffEC9EFC),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(
                    width: 10,
                    height: 100,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
