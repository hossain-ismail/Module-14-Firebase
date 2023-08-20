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
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> getDataFromFirebase()async{
    CollectionReference basketBallRef = _firebaseFirestore.collection("BasketBall");
    final DocumentReference docReference = basketBallRef.doc('1_ban_vs_ind');
    final data = await docReference.get();
    print("Data output are : ${data.data()}");
  }
  @override
  void initState() {
    // TODO: implement initState
    getDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Score App"),
      ),

     body:  FutureBuilder<DocumentSnapshot>(
        future: _firebaseFirestore
            .collection('BasketBall')
            .doc('1_ban_vs_ind').get(), //get() provide one time future value not multiple, its not use for live streaming
        builder: (context,AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
          print(snapshot.data?.data());
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          if(snapshot.hasData && !snapshot.data!.exists){
            return const Text("Document does not exist");
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          final score=snapshot.data!;

          return Center(
            child: Column(
              children: [
                const SizedBox(height: 40,),
                Text(
                  score.get('Match Name'),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(score.get('score_team_a').toString(),style: Theme.of(context).textTheme.titleLarge,),
                        Text(score.get('team_a'),style: Theme.of(context).textTheme.titleLarge,),
                      ],
                    ),
                    Text('vs',style: Theme.of(context).textTheme.titleMedium,),
                    Column(
                      children: [
                        Text(score.get('score_team_b').toString(),style: Theme.of(context).textTheme.titleLarge,),
                        Text(score.get('team_b'),style: Theme.of(context).textTheme.titleLarge,),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
