import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
          'uid': user.uid,
          'name': name,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
        });
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

  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
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
