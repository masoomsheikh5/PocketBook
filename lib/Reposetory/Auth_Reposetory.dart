
  import 'dart:async';

import 'package:expensetracker/routes/App_Routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthRepo{



final FirebaseAuth _auth = FirebaseAuth.instance;
RxString varificationid="".obs;
// Function to send the verification code

Future<bool> sendVerificationCode(String phoneNumber) async {
  Completer<bool> completer = Completer<bool>();

  try {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91$phoneNumber",
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieve verification code
        await _auth.signInWithCredential(credential);
        if (!completer.isCompleted) completer.complete(true);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Verification failed
        print('Verification failed: ${e.message}');
        if (!completer.isCompleted) completer.complete(false);
      },
      codeSent: (String verificationId, int? resendToken) async {
        varificationid.value = verificationId;
        print("varificationid${varificationid.value}");
        // Save the verification ID for future use
        print('Code sent. Verification ID: $verificationId');
        if (!completer.isCompleted) completer.complete(true);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('Code auto retrieval timeout. Verification ID: $verificationId');
        if (!completer.isCompleted) completer.complete(false);
      },
      timeout: Duration(seconds: 60),
    );
  } catch (e) {
    print('Error sending verification code: $e');
    if (!completer.isCompleted) completer.complete(false);
  }

  return completer.future;
}



// Function to verify the code entered by the user
Future<void> verifyCodeAndSignIn(String smsCode) async {
  try {
    // Create PhoneAuthCredential
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: varificationid.value,
      smsCode: smsCode,
    );

    // Sign the user in with the credential
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    
    // Get the UID from UserCredential
    String userUid = userCredential.user!.uid;
    print("User UID: $userUid");

    // Store UID in SharedPreferences
    await storeUidInSharedPreferences(userUid);
  } catch (e) {
    print('Error verifying code and signing in: $e');
    // Handle error as needed
  }
}

// Function to store UID in SharedPreferences
Future<void> storeUidInSharedPreferences(String uid) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('uid', uid);
  print("uidd of user${prefs.getString('uid')}");
}
}