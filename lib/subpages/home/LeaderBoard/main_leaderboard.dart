import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' show where;
import 'package:pi_carbon_tracer/main.dart';

int place_cur_user = 1;

class MainLeaderBoardPage extends StatefulWidget {
  const MainLeaderBoardPage({Key? key}) : super(key: key);

  @override
  _MainLeaderBoardPageState createState() => _MainLeaderBoardPageState();
}

class _MainLeaderBoardPageState extends State<MainLeaderBoardPage> {
  late Future<List<List<String>>> _candidateNames;

  @override
  void initState() {
    super.initState();
    _candidateNames = _fetchCandidateNames();
  }

  Future<List<List<String>>> _fetchCandidateNames() async {
    var db = await DB.getDB();

    if (db != null) {
      var collection = db.collection('leaderboard');
      var cursor = await collection
          .find(
            where.sortBy('total',
                descending: false), // Replace 'fieldName' with your field name
          )
          .toList();

      // Extracting data from MongoDB cursor and transforming it into the required format
      List<List<String>> names = [];
      int i = 1;
      for (var entry in cursor) {
        List<String> rowData = [
          entry['name']?.toString() ?? '', // Ensure name is converted to String
          '${((entry['total'] ?? 0) - 1000).toInt().abs()} pts'
        ];
        if (entry["name"] == cur_user) {
          place_cur_user = i;
        } else {
          i = i + 1;
          place_cur_user = i;
        }
        names.add(rowData);
      }

      print(names);
      return names;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<List<String>>>(
      future: _candidateNames,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Scaffold(
            body: ListView(
              scrollDirection: Axis.vertical,
              children: [
                const PodiumWidget(),
                RankLadder(candidateNames: snapshot.data ?? []),
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
            ),
          );
        }
      },
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

// Other Widget classes remain unchanged
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
            'Congrats! You placed  th!',
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

class RankLadder extends StatelessWidget {
  final List<List<String>> candidateNames;

  const RankLadder({Key? key, required this.candidateNames}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Leaderboard',
            style: TextStyle(
              fontFamily: 'Capriola',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: candidateNames.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(candidateNames[index][0]), // Candidate name
                subtitle: Text(candidateNames[index][1]), // Candidate points
              );
            },
          ),
        ],
      ),
    );
  }
}
