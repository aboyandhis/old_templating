import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> userStream;

  User currentUser;

  void handleUserEvent(User user) {
    if (user != null) {
      currentUser = user;
      notifyListeners();
      print(user);
    }
  }

  void handleError(e) {
    Exception('Something went wrong ' + e);
  }

  void listenUser(User user) {
    // update user and notify
    currentUser = user;
    notifyListeners();
  }

  // We need a reference to this so we can dispose of it when were done
  StreamSubscription<User> _userSubscription;

  // Clean up
  void dispose() {
    super.dispose();
    _userSubscription.cancel();
  }

  // Sign in with facebook
  signInWithFaceBook() async {
    FacebookAuthProvider _facebookAuthProvider = FacebookAuthProvider();
    _facebookAuthProvider.addScope('email');
    try {
      UserCredential cred =
          await _firebaseAuth.signInWithPopup(_facebookAuthProvider);
      // If everything goes well this will sign us into firebase
      if (cred.user != null) {
        // Do a null check and handle the subscription
        userStream = _firebaseAuth.authStateChanges();
        // Tell a friend
        notifyListeners();
      }
    } catch (e) {
      // Somethings not right
      new Exception('Facebook ' + e);
    }
  }
}
