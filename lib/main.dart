import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const BasketBallLiveScoreApp());
}

class BasketBallLiveScoreApp extends StatelessWidget {
  const BasketBallLiveScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Score App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('BasketBall')
                    .doc('1_ban_vs_ind')
                    .get(),
                //get() provide one time future value not multiple, its not use for live streaming
                builder: (context,
                    AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
                  print(snapshot.data?.data());
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  if (snapshot.hasData && !snapshot.data!.exists) {
                    return const Text("Document does not exist");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final score = snapshot.data!;

                  return Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          score.get('Match Name'),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  score.get('score_team_a').toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  score.get('team_a'),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            Text(
                              'vs',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Column(
                              children: [
                                Text(
                                  score.get('score_team_b').toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  score.get('team_b'),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
            FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('BasketBall')
                    .doc('Bangladesh_vs_England')
                    .get(),
                builder: (context,
                    AsyncSnapshot<DocumentSnapshot<Object?>> snapshot2) {
                  if (snapshot2.hasError) {
                    return Text(snapshot2.error.toString());
                  }
                  if (snapshot2.hasData && !snapshot2.data!.exists) {
                    return const Text("Document does not exist");
                  }
                  if (snapshot2.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final score2 = snapshot2.data!;
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(score2.get('match_name'),), //from Cloud Firestore
                        // score.get('Match Name'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                //first team
                                Text(
                                  score2.get('Score_team_A').toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(score2.get('team_A'),
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                              ],
                            ),
                            Text('vs',
                                style: Theme.of(context).textTheme.titleMedium),
                            Column(
                              children: [
                                //second team
                                Text(
                                  score2.get('Score_team_B').toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(score2.get('team_B'),
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }),
            SizedBox(
              height: 30,
            ),
            FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('BasketBall')
                    .doc('2_ban_iran')
                    .get(),
                //get() provide one time future value not multiple, its not use for live streaming
                builder: (context,
                    AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
                  print(snapshot.data?.data());
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  if (snapshot.hasData && !snapshot.data!.exists) {
                    return const Text("Document does not exist");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final score3 = snapshot.data!;

                  return Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          score3.get('match_name'),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  score3.get('score_team_a').toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  score3.get('team_a'),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            Text(
                              'vs',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Column(
                              children: [
                                Text(
                                  score3.get('score_team_b').toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  score3.get('team_b'),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
