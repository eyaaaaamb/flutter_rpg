import 'package:flutter/material.dart';
import 'package:rpg_project/models/character.dart';
import 'package:rpg_project/shared/styled_text.dart';
import 'package:rpg_project/theme.dart';

class StatsTable extends StatefulWidget {
 

  const StatsTable(this.character,{super.key});
 final Character character;
  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          //Available points
          Container(
           color:AppColors.secondaryColor,
           padding: const EdgeInsets.all(8),
           child:Row(
            children: [
              //fucntion for the icon
              Icon(Icons.star,
              color:widget.character.points >0 ? Colors.yellow : Colors.grey,
              ),
              const SizedBox(width: 20,),
              const StyledText('Stat points avaibles'),
                Expanded(child: const SizedBox(width: 20,)),
                //important
                
              StyledHeading(widget.character.points.toString()),

            ],
            ),
          ),
          //stats table
          Table(
            children: widget.character.statsAsFormattedList.map((stat){
              return TableRow(
                decoration:BoxDecoration(
                  color:AppColors.secondaryColor,
                  
                ) ,
                children: [
                 //stat title
                 TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: StyledHeading(stat['title']!),
                 ),),
                //stat value
                TableCell(
                   verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: StyledHeading(stat['value']!),
                 ),),
                 //icon to increase stats
                 TableCell(
                   verticalAlignment: TableCellVerticalAlignment.middle,
                  child: IconButton(onPressed: (){
                    setState(() {
                       widget.character.increaseStat(stat['title']!);
                    });
                   
                  }, icon:Icon(Icons.arrow_upward,color:AppColors.textColor))
                  ),
                 //icon to decrease stats
                 TableCell(
                   verticalAlignment: TableCellVerticalAlignment.middle,
                  child: IconButton(onPressed: (){
                    setState(() {
                       widget.character.decreaseStat(stat['title']!);
                    });
                   
                  }, icon:Icon(Icons.arrow_downward,color:AppColors.textColor))
                  ),
                ],
              );

            }).toList(),

            
          ),

        ],
        
      ),
    );
  }
}