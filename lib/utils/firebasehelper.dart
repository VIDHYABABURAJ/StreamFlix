import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

String handleException(e) {
  print(e.code);
  var status;
  switch (e.code) {
    case "invalid-email":
      status = 'Invalid email';
      return status;
    case "user-disabled":
      status = "User corresponding to the given email has been disabled";
      return status;
    case "user-not-found":
      status = "There is no user corresponding to the given email";
      return status;
    case "wrong-password":
      status = "Password is invalid for the given email";
      return status;
    case "email-already-in-use":
      status =
      "There is already exists an account with the given email address";
      return status;
    case "operation-not-allowed":
      status =
      "Email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.";
      return status;
    case "invalid-credential":
      status = "Your email and password was invalid";
      return status;

    default:
      status = 'something went wrong';
  }
  return status;
}

void custompopup({required BuildContext context, required String title}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return GiffyDialog.image(
        Image.network("https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
          height: 200,
          fit: BoxFit.cover,
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'CANCEL'),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
