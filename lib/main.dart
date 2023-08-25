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
            //first
            FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('BasketBall')
                    .doc('1_ban_vs_ind')
                    // .collection('abs') // if document has collection and then doc inside new collection and again doc inside collection and so on
                    // .doc('dfdf')
                    // .collection('abs')
                    // .doc('dfdf')
                    // .collection('abs')
                    // .doc('dfdf')
                    // .collection('abs')
                    // .doc('dfdf')
                    // .collection('abs')
                    // .doc('dfdf')
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

            //2nd
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
                        Text(
                          score2.get('match_name'),
                          style: Theme.of(context).textTheme.titleLarge,
                        ), //from Cloud Firestore

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
            //3rd
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //update apply inside first doc of collection
          FloatingActionButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('BasketBall')
                  .doc('1_ban_vs_ind')
                  // .update({'Match Name':'Ban vs Ind','score_team_b':50});//data will update in firebase by fb button click, and display by hot-reload
                  .update({
                'score_team_b': 5
              }); //we can access by directly where data change its map or key value, not need to 'Match Name':'Ban vs Ind',
            },
            child: const Text('Update'),
          ),
          /* set apply inside first doc of collection, set will replace existing data, only contain the data what we have enter inside this onPressed(),
          so if any data which necessary in data base but don't put inside this onPress() then those data will remove from data base and will throw error,
           because FutureBuilder() using those data, so need to full database put inside this set() method*/
          FloatingActionButton(
            //team_b name change England to pakistan, score of team b is also changed
            onPressed: () {
              FirebaseFirestore
                  .instance
                  .collection('BasketBall')
                  .doc('Bangladesh_vs_England')
                  .set({
                // we can change any data what ever we want, just maintain the key
                'match_name':'Bangladesh vs England', // keep it as it is to notice the change
                'team_A':'Bangladesh',
                'team_B':'Pakistan', // Changed England to Pakistan
                'Score_team_A':12,
                'Score_team_B':7,
              });
            },
            child:const Text('Set'),
          ),
          // delete apply inside first doc of collection,
          FloatingActionButton(
            onPressed: () {},
            child:const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
