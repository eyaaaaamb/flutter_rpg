//container decoration gradiant
import 'package:flutter/material.dart';
import 'package:rpg_project/theme.dart';
class Styledbtn extends StatelessWidget {
  const Styledbtn({super.key,
   required this.onPressed,
 required  this.child,});
final Widget child;
final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child:Container (
        decoration: BoxDecoration(
          gradient :LinearGradient(
              colors:[AppColors.primaryAccent,AppColors.primaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child:child,
      ),
    );
  }
}