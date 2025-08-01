import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:onelook/controllers/user_controller.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? _cachedUserId;
  bool get isLoggedIn => _auth.currentUser != null;
  User? get currentUser => _auth.currentUser;
  String? get currentUserId {
    if (_cachedUserId != null) return _cachedUserId;

    final user = _auth.currentUser;
    if (user != null) {
      _cachedUserId = user.uid;
    }
    return _cachedUserId;
  }

  AuthRepository() {
    _auth.authStateChanges().listen((User? user) {
      Get.find<UserController>().setUserData(user);
    });
  }

  // SIGN UP with Email & Password + Save Name
  Future<User?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(name);
        await _firestore.collection('users').doc(user.uid).set({
          'profile': {
            'name': name,
            'email': email,
            'age': null,
            'gender': null,
          }
        });
         Get.find<UserController>().setUserData(user);
        return user;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthError(e);
    } catch (e) {
      throw Exception('Signup failed: ${e.toString()}');
    }
  }

  // LOGIN with Email & Password
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
       Get.find<UserController>().setUserData(userCredential.user);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthError(e);
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  // CHECK if user is already logged in
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Call this after login/signup
  void cacheUserId() {
    final user = _auth.currentUser;
    if (user != null) {
      _cachedUserId = user.uid;
    }
  }

  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
    Get.find<UserController>().setUserData(null);
  }

  // PRIVATE ERROR HANDLER
  Exception _handleFirebaseAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return Exception('Invalid email format.');
      case 'user-disabled':
        return Exception('User has been disabled.');
      case 'user-not-found':
        return Exception('No user found with this email.');
      case 'wrong-password':
        return Exception('Incorrect password.');
      case 'email-already-in-use':
        return Exception('Email already registered.');
      case 'weak-password':
        return Exception('Password should be at least 6 characters.');
      case 'operation-not-allowed':
        return Exception('This operation is not allowed.');
      default:
        return Exception('Auth Error: ${e.message}');
    }
  }
}
