import 'package:flutter/material.dart';
import 'package:rpg_project/models/character.dart';
import 'package:uuid/uuid.dart';
import 'package:rpg_project/models/vocation.dart';
import 'package:rpg_project/screens/create/vocation_card.dart';
import 'package:rpg_project/shared/styledBtn.dart';
import 'package:rpg_project/shared/styled_text.dart';
import 'package:rpg_project/theme.dart';

var uuid =const Uuid();
class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}


class _CreateState extends State<Create> {
  final _nameController =TextEditingController();
  final _sloganController =TextEditingController();
  //recommended
  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }
  //handling vation sleection 
  Vocation selectedVocation = Vocation.junkie;
  void updateVocation(Vocation vocation){
    setState(
        (){
          selectedVocation=vocation;
        }
    );

  }
  //submit handler
  void handleSubmit(){
    //not empty
    if(_nameController.text.trim().isEmpty){
      //show error dialog 
      return;
    }if(_sloganController.text.trim().isEmpty){
        //show error dialog 
      return;
    }

    //add a character to list 
    //trim text
    characters.add(Character(name: _nameController.text.trim(), slogan: _sloganController.text.trim(), vocation: selectedVocation, id: uuid.v4()));
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const StyledText('Character creating'),
        centerTitle: true,
      ),
      body:Container(
        padding:const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
        child:SingleChildScrollView(
          child: Column(
             children:[
              //welcome message
             Center(child:Icon(Icons.code, color: AppColors.primaryColor)),
              const  Center(child:StyledHeading('Welcone new player')),
               const  Center(child:StyledText('Create a name & slogan for ur player')),
               const SizedBox(height: 30),
               //input
               TextField(
                controller: _nameController,
              style: TextStyle(color:Colors.white),
              cursorColor: Colors.grey,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label:StyledText("character name"),
                ),
               ),
               const SizedBox(height: 20),
               TextField(
                     controller: _sloganController,
                       style: TextStyle(color:Colors.white),
                       cursorColor: Colors.grey,
                       decoration: const InputDecoration(
          
                  prefixIcon: Icon(Icons.chat),
                  label:StyledText("character slogan "),)
               ),
               const SizedBox(height:30),
               //select voction title
                Center(child:Icon(Icons.code, color: AppColors.primaryColor)),
              const  Center(child:StyledHeading('choose a vocation')),
               const  Center(child:StyledText('this determines ur available skills')),
               const SizedBox(height: 30),
               //vocation cards

                VocationCard(
                  selected: selectedVocation == Vocation.junkie,
                //we can dont call it onTap
                onTap:updateVocation,
                vocation: Vocation.junkie
                ),
               VocationCard(
                selected: selectedVocation == Vocation.ninja,
                 onTap:updateVocation,
                vocation: Vocation.ninja),
               VocationCard(
                selected: selectedVocation == Vocation.raider,
                 onTap:updateVocation,
                 vocation: Vocation.raider),
               VocationCard(
                selected: selectedVocation == Vocation.wizard,
                 onTap:updateVocation,
                 vocation: Vocation.wizard),
                 //good luck msg
                 Center(child:Icon(Icons.code, color: AppColors.primaryColor)),
              const  Center(child:StyledHeading('good luck')),
               const  Center(child:StyledText('And enjoy the journey....')),
               const SizedBox(height: 30),
               Center(
                child:Styledbtn(
                  onPressed: handleSubmit , 
                 child:  const StyledHeading("Create character "),
                )
          
               )
             ],
          ),
        ),
      ),


    );
  }
}