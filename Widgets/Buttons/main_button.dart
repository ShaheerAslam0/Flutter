import 'package:flutter/material.dart';

Widget mainButton({
  required VoidCallback onTap,
  required String text,
  bool Function()? isValid,
  VoidCallback? onTapInvalid,
  bool? isProcessing,
}) {
  isProcessing = isProcessing ?? false;

  // VoidCallback? buttonOnPressed = isProcessing == true
  //     ? null
  //     : (isValid == null || isValid() == true ? onTap : onTapInvalid);

  void onPressed() {
    if (isProcessing != null && isProcessing == true) {
      return;
    }

    if (isValid == null) {
      onTap();
      return;
    }

    if (isValid() == true) {
      onTap();
    }

    if (isValid() == false && onTapInvalid != null) {
      onTapInvalid();
    }
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(35.0)),
        gradient: isValid == null || isValid() == true
            ?  LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xff007bff).withOpacity(0.9),
            const Color(0xff0062DC),
            const Color(0xff004aad).withOpacity(0.9),
          ],
          stops: const [0.1, 0.5, 0.9],
        )
            : null,
        color: isValid == null || isValid() == true
            ? null
            : const Color.fromRGBO(240, 240, 240, 1),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          minimumSize: const Size(double.infinity, 60),
        ),
        onPressed: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: !isProcessing,
              child: Text(
                text.toUpperCase(),
                style: TextStyle(
                  color: isValid == null || isValid() == true
                      ? Colors.white
                      : const Color.fromARGB(255, 130, 130, 130),
                  fontFamily: 'BebasNeue-Regular',
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ),
            Visibility(
              visible: isProcessing,
              child: const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
