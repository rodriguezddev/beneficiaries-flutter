import 'package:flutter/material.dart';

import '../../core/constants/spacings.dart';

class CustomDialog {
  static showCustomDialog({
    required BuildContext context,
    required String title,
    required Function handleConfirm,
    required String textAcceptButton,
    required String textCancelButton,
    required Color color,
    String? content,
  }) async {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        content: content != null
          ? Text(
            content,
            textAlign: TextAlign.center,
          )
        : null,
        contentTextStyle: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        titleTextStyle: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w800,
        ),
        actionsOverflowButtonSpacing: Spacings.overflowButtonSpacing02,
        actionsPadding: const EdgeInsets.symmetric(
          vertical: 18.0,
        ),
        actions: [
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 65,
                      vertical: 15,
                    ),
                    backgroundColor: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Spacings.borderRadius02,
                      ),
                    ),
                    elevation: 0.0,
                  ),
                  onPressed: () => {
                    handleConfirm(),
                  Navigator.pop(dialogContext),
                  },
                  child: Text(
                    textAcceptButton,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: color,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 65,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Spacings.borderRadius02,
                      ),
                    ),
                    side: BorderSide(
                      width: 1.0,
                      color: color,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(dialogContext);
                  },
                  child: Text(
                    textCancelButton,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
