

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

Future<int>getServerTimeOffset()async{
  int offest=0;
  var source=await FirebaseDatabase.instance
  .reference()
  .child('.info/serverTimeOffset')
  .once();
  offest=source.value;
  int estimatedServerTimeInMs=DateTime.now().millisecondsSinceEpoch+offest;

  return estimatedServerTimeInMs;
}