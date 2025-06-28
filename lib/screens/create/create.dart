import 'package:flutter/material.dart';
import 'package:rpg_project/shared/styled_text.dart';
import 'package:rpg_project/theme.dart';

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
    // TODO: implement dispose
    super.dispose();
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
        child:Column(
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
           ],
        ),
      ),


    );
  }
}