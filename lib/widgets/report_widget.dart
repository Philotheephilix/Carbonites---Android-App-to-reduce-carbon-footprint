import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/models/buttons.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({
    super.key,
    required this.score,
  });

  final int score;

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  final List<List<dynamic>> colorCategoryData = [
    [Colors.pink, 'food'],
    [Colors.blue, 'travel'],
    [Colors.green, 'goods'],
    [Colors.orange, 'service'],
    [Colors.red, 'loan'],
    [Colors.black, ''],

  ];

  final List<List<dynamic>> colorPercentData = [
    [Colors.pink, '60'],
    [Colors.blue, '60'],
    [Colors.green, '60'],
    [Colors.orange, '60'],
    [Colors.red, '60'],
    [Colors.black, '60'],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Report',
                style: TextStyle(
                  fontFamily: 'Capriola',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomPopupButton(
                dimensions: const [120.0, 40.0],
                content: _popupContainer(),
                label: 'Legends',
                labelSize: 16,
                gradient: const [Color(0xFF96B0F2), Color(0xFF7BCCFF)],
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                CategoryWisePercentBar(
                  dataList: colorPercentData,
                ),
                Container(
                  height: 140,
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(20),
                  child: PercentIndicators(
                    dataList: colorPercentData,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'All around score: ${widget.score}',
                    style: const TextStyle(
                      fontFamily: 'Capriola',
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _popupContainer() {
    return Container(
                width: 300,
                height: 200,
                color: Colors.transparent,
                child: PercentIndicators(
                  dataList: colorCategoryData,
                ),
              );
  }
}

class PercentIndicators extends StatelessWidget {
  const PercentIndicators({
    super.key,
    required this.dataList,
  });

  final List<List<dynamic>> dataList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _dataElement(dataList[0]),
            _dataElement(dataList[1]),
            _dataElement(dataList[2]),
          ],
        ),
        const SizedBox(
          width: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _dataElement(dataList[3]),
            _dataElement(dataList[4]),
            _dataElement(dataList[5]),
          ],
        ),
      ],
    );
  }

  Row _dataElement(List<dynamic> data) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: data[0],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(data[1]),
      ],
    );
  }
}

class CategoryWisePercentBar extends StatelessWidget {
  const CategoryWisePercentBar({
    super.key,
    required this.dataList,
  });

  final List<List<dynamic>> dataList;

  @override
  Widget build(BuildContext context) {
    double widgetHeight = 15;
    return Container(
      height: 60.0,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Container(
          height: widgetHeight,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.parse(dataList[0][1]),
                color: dataList[0][0],
              ),
              Container(
                width: double.parse(dataList[1][1]),
                color: dataList[1][0],
              ),
              Container(
                width: double.parse(dataList[2][1]),
                color: dataList[2][0],
              ),
              Container(
                width: double.parse(dataList[3][1]),
                color: dataList[3][0],
              ),
              Container(
                width: double.parse(dataList[4][1]),
                color: dataList[4][0],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
