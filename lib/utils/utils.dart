import 'package:flutter/material.dart';

// ♦ The "showSnackBar()" Function:
showSnackBar(BuildContext context, String text) {
  // ♦ For showing "Snack Bars" and "Material Banners"
  //   → at the "Bottom" and "Top" of the "Screen":
  return ScaffoldMessenger.of(context).showSnackBar(
    // ♦ A "Lightweight Message" with an "Optional Action"
    //    → which is "Displayed" for "Short Time"
    //    → in the "Bottom" of the "Screen".
    SnackBar(
      content: Text(text),
    ),
  );
}
