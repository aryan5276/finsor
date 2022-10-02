// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';

// class FirebaseMethods {
//   var auth = FirebaseAuth.instance;

//   Future<String> otpVerification(String phoneNumber) async {
//     String verificationCode = "";

//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: phoneNumber,

//         // The sms otp is stored in verficationId
//         codeSent: (verificationId, resendToken) {
//           verificationCode = verificationId;
//         },

//         // Resend a new code after 2 minutes
//         timeout: Duration(minutes: 2),
//         codeAutoRetrievalTimeout: (verificationId) {
//           verificationCode = verificationId;
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print(e.message);
//         },
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           auth.signInWithCredential(credential).then((value) => () {
//                 if (value.user != null) {
//                   print("User logged in");
//                 }
//               });
//         });
//     return verificationCode;
//   }

//   Future<bool?> otpManualVerification(
//       String verificationID, String codeEntered) async {
//     Future<bool> proceedForward = Future<bool>.value(false);
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationID, smsCode: codeEntered);
//     await auth.signInWithCredential(credential).then((value) {
//       if (value.user != null) {
//         print("User logged in");
//         print(value.user);
//         proceedForward = Future<bool>.value(true);
//       } else {
//         print("Not logged in");

//         proceedForward = Future<bool>.value(false);
//       }
//       return proceedForward;
//     });
//   }
// }
