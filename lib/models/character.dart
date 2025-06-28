

import 'package:rpg_project/models/skill.dart';
import 'package:rpg_project/models/stats.dart';
import 'package:rpg_project/models/vocation.dart';

class Character with Stats {

  // constructor 
  Character({ 
    required this.name, required this.slogan, required this.vocation, required this.id,
  });

  // fields
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  // getters
  get isFav => _isFav;

  // methods
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkills(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

}
//dummy charzcter data
List<Character> characters =[
  Character(name:'klara' , slogan: ('helloe'), vocation:Vocation.wizard, id: '1'),
    Character(name:'kll' , slogan: ('heoe'), vocation:Vocation.junkie, id: '2'),
      Character(name:'leya' , slogan: ('hlloe'), vocation:Vocation.raider, id: '3'),
      Character(name:'kla' , slogan: ('hlloe'), vocation:Vocation.wizard, id: '4'),
];