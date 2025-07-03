
import 'package:flutter/material.dart';
import 'package:rpg_project/models/character.dart';
import 'package:rpg_project/screens/profile/skill_list.dart';
import 'package:rpg_project/screens/profile/state_table.dart';
import 'package:rpg_project/shared/styledBtn.dart';
import 'package:rpg_project/shared/styled_text.dart';
import 'package:rpg_project/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key,required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:StyledText(character.name),
      ),
      body:SingleChildScrollView(
 child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    //basic info _image vocation description
    Container(
      padding: const EdgeInsets.all(16),
      color:AppColors.secondaryColor,
      child:Row(children: [
        Image.asset("assets/img/vocations/${character.vocation.image}",height: 140,width: 140,),
        const SizedBox(width: 20,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyledHeading(character.vocation.title),
              StyledText(character.vocation.description),
              
              
            ],
          ),
        )
      ],),
    ),


    //weapon and ability
   const SizedBox(height: 20,),
   Center(
  child: Icon(Icons.code,color:AppColors.primaryColor),

   ),
   Padding(
    padding: const EdgeInsets.all(16),
    child: Container(
      width: double.infinity,
      padding:const EdgeInsets.all(16),
      color:AppColors.secondaryColor,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StyledHeading("Slogan"),
          StyledText(character.slogan),
          const SizedBox(height: 10,),
            const StyledHeading("Weapon"),
          StyledText(character.vocation.weapon),
          const SizedBox(height: 10,),
            const StyledHeading("Unique Ability"),
          StyledText(character.vocation.ability),
          const SizedBox(height: 10,),
          
          
          

        ],),

    ),
    ),

    //stats &skills
       Container(
        alignment: Alignment.center,
        child:Column(
          children: [
            StatsTable(character),
            SkillList(character),

          ],
        ),
       ),
        

    //save button
      Styledbtn(
        onPressed:(){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:const StyledHeading("character was saved"),
            showCloseIcon :true,
            duration: const Duration(seconds: 2),
            backgroundColor: AppColors.secondaryColor,
          ));
        },
         child: const StyledHeading("save character"),
         
         ),
         const SizedBox(height: 20,),

  ],
 ),
      ),
    );
  }
}