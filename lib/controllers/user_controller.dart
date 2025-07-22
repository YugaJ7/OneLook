import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends GetxController {
  final RxString _userName = ''.obs;
  String get userName => _userName.value;

  final RxString _userEmail = ''.obs;
  String get userEmail => _userEmail.value;

  final Rx<User?> _currentUser = Rx<User?>(null);
  User? get currentUser => _currentUser.value;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((User? user) {
      _currentUser.value = user;
      if (user != null) {
        _loadUserName(user.uid);
      } else {
        _userName.value = '';
        _userEmail.value = '';
      }
    });
  }

  //Set user data after login/signup
  void setUserData(User? user) {
    _currentUser.value = user;
    if (user != null) {
      _userName.value = user.displayName ?? '';
      _userEmail.value = user.email ?? '';
      _loadUserName(user.uid);
    } else {
      _userName.value = '';
      _userEmail.value = '';
    }
  }

  Future<void> _loadUserName(String uid) async {
    try {
      final docSnapshot = await _firestore.collection('users').doc(uid).get();
      if (docSnapshot.exists && docSnapshot.data() != null) {
        final profileData = docSnapshot.data()!['profile'] as Map<String, dynamic>?;
        if (profileData != null && profileData.containsKey('name')) {
          _userName.value = profileData['name'].toString();
        }
      }
    } catch (e) {
      _userName.value = _auth.currentUser?.displayName ?? '';
    }
  }
}