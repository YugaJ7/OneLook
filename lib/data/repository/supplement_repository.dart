import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:onelook/data/repository/auth_repository.dart';
import '../models/supplement_model.dart';

class SupplementRepository {
  final _firestore = FirebaseFirestore.instance;

  // Adds a supplement to the user's supplement collection.
  Future<void> addSupplement(String userId, SupplementModel supplement) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('supplements')
        .add(supplement.toMap());
  }

  // Fetch only supplements that are still active (endDate >= today)
  Future<List<Map<String, dynamic>>> getActiveSupplements() async {
    try {
      final userId = Get.find<AuthRepository>().currentUserId;
      if (userId != null) {
        final today = DateTime.now();
        final snapshot = await _firestore
            .collection('users')
            .doc(userId)
            .collection('supplements')
            .where('endDate', isGreaterThanOrEqualTo: today.toIso8601String())
            .get();
        return snapshot.docs.map((doc) {
          return {
            'supplement': SupplementModel.fromMap(doc.data()),
            'docId': doc.id,
          };
        }).toList();
      } else {
        throw Exception("User not logged in");
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  // Update the status of supplement
  Future<void> updateTracking(
      String docId, int index, String doseKey, bool newValue) async {
    try {
      final userId = Get.find<AuthRepository>().currentUserId;
      if (userId != null) {
        final docRef = _firestore
            .collection('users')
            .doc(userId)
            .collection('supplements')
            .doc(docId);
        final doc = await docRef.get();

        if (doc.exists) {
          final data = doc.data()!;
          List<Map<String, bool>> tracking = List<Map<String, bool>>.from(
              (data['tracking'] ?? []).map((e) => Map<String, bool>.from(e)));

          if (index < tracking.length) {
            tracking[index][doseKey] = newValue;
            await docRef.update({'tracking': tracking});
          }
        } else {
          log("Document with ID $docId does not exist.");
        }
      } else {
        throw Exception("User not logged in");
      }
    } catch (e) {
      log("Error updating tracking: $e");
    }
  }
}
