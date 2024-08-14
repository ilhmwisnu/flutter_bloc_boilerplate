import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogHelper {
  DialogHelper._();

  static showError(BuildContext context, String errorText) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Something went wrong"),
        titleTextStyle: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        content: Text(errorText),
        actions: [
          ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: Text("Okay"))
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
    // showGeneralDialog(
    //   context: context,
    //   pageBuilder: (context, animation, secondaryAnimation) {
    //     return ;
    //   },
    // );
  }
}
