import 'package:flutter/material.dart';
import 'package:rpg_project/models/character.dart';
import 'package:rpg_project/screens/profile/profile.dart';
import 'package:rpg_project/shared/styled_text.dart';
import 'package:rpg_project/theme.dart';


class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
           Image.asset('assets/img/vocations/${character.vocation.image}',
           width:80,
          
           ),
          const  SizedBox(width:20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      StyledHeading(character.name),
      StyledText(character.vocation.title),

    ],
          ),
            const Expanded(
              child: SizedBox(),

            ),
            
            IconButton(
              onPressed: () {
                // navigate to character profile screen
                  Navigator.push(context,MaterialPageRoute(
                  builder:(ctx)=>  Profile(character:character),
                ));
              },
              icon: Icon(Icons.arrow_forward, color: AppColors.textColor)
            ),
          ]
        ),
      ),
    );
  }
}