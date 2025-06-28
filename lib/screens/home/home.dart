import 'package:flutter/material.dart';
import 'package:rpg_project/models/character.dart';
import 'package:rpg_project/screens/character_card.dart';
import 'package:rpg_project/shared/styledBtn.dart';
import 'package:rpg_project/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledText('Your Characters'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // list of characters
            Expanded(
              child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (_, index) {
                  return CharacterCard(characters[index]);
                }
              ),
            ),
            
            Styledbtn
(
              onPressed: () {
                // navigate to the create screen
              },
              child: const StyledHeading('Create New'),
            ),
          ]
        ),
      ),
    );
  }
}