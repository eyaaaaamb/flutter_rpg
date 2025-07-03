import 'package:flutter/material.dart';
import 'package:rpg_project/models/character.dart';
import 'package:rpg_project/models/skill.dart';
import 'package:rpg_project/shared/styled_text.dart';
import 'package:rpg_project/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character,{super.key});
final Character character;
  @override
  State<SkillList> createState() => _SkillListState();
}
//late , initState
class _SkillListState extends State<SkillList> {
 late List<Skill> availableSkills;
 late Skill selectedSkill;

  @override
void initState(){
  availableSkills = allSkills.where((skill){
    return skill.vocation == widget.character.vocation;
      
  }).toList();
   if(widget.character.skills.isEmpty){
    selectedSkill = availableSkills[0];
   }
   if(widget.character.skills.isNotEmpty){
     selectedSkill =widget.character.skills.first;
   }

   super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child:Container(
        padding: const EdgeInsets.all(16),
        color:AppColors.secondaryColor,
        child:Column(
          children: [
           const StyledHeading('choose an active skill'),
           const StyledTitle('Skills are unique to your vocation'),
           const SizedBox(height: 20,),
           Row(
            children: [
              ...availableSkills.map((skill) {
                return Container(
                  // You can add child widgets or styling here
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(2),
                  color:skill == selectedSkill ? Colors.yellow : Colors.transparent,
                  child:GestureDetector(
                    onTap:(){
                      setState((){
                            widget.character.updateSkills(skill);
                            selectedSkill =skill;
                      });

                    },
                    child: Image.asset('assets/img/skills/${skill.image}',width: 70,)),
                );
              
              }),
            ],
            
           ),
           const SizedBox(height: 10,),
           StyledText(selectedSkill.name),
          ],
        ) ,

      ),
      );
  }
}