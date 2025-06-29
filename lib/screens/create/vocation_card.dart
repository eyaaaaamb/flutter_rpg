import 'package:flutter/material.dart';
import 'package:rpg_project/models/vocation.dart';
import 'package:rpg_project/shared/styled_text.dart';
import 'package:rpg_project/theme.dart';

class VocationCard extends StatelessWidget {
  //onTap method
  const VocationCard({super.key,required this.vocation,required this.onTap,required this.selected});
  final Vocation vocation;
  final bool selected;
final void Function(Vocation) onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        onTap(vocation);
      },
      child: Card(
        //style if selected
        color:selected ?  AppColors.secondaryColor : Colors.transparent,
        //we dont apply paddings directlyt o a card we use a padding widget
        child:Padding(
          padding: const EdgeInsets.all(8),
          child:Row(children: [
      
      
            //vaction img
            //blending the img ???
            Image.asset('assets/img/vocations/${vocation.image}',
            width:80,
            colorBlendMode: BlendMode.color,
            //if not selected  style it like this 
            color: !selected ? Color.fromRGBO(255,255,255,0.8) : Colors.transparent,
            ),
           const SizedBox(width: 10),
           Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading(vocation.title),
                StyledText(vocation.description),
              ],
            )
           )
          ],)
      
        )
      ),
    );
  }
}