import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/activity_model.dart';

class ActivityRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> addActivity(String userId, ActivityModel activity) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('activities')
        .add(activity.toMap());
  }
}
