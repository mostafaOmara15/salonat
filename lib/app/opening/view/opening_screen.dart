import 'package:flutter/material.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/spaces.dart';
import '../widgets/day_buttons.dart';
import '../widgets/time_field.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({super.key});

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  Widget build(BuildContext context) {

    Map<String, List<String>> openingTime = {
      "Sat" : ["09:00 a.m", "10:00 p.m"],
      "Sun" : ["09:00 a.m", "10:00 p.m"],
      "Mon" : ["09:00 a.m", "10:00 p.m"],
      "Tue" : ["09:00 a.m", "10:00 p.m"],
      "Wed" : ["09:00 a.m", "10:00 p.m"],
      "Thu" : ["09:00 a.m", "10:00 p.m"],
      "Fri" : ["09:00 a.m", "10:00 p.m"],
    };

    List<bool> isSelected = [false, true, false, false, false, false, false];

    return Scaffold(
      appBar: AppBar(title: const Text('Editing')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height:context.height *0.06,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: openingTime.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
                        child: TextButton(
                            child: Text(
                                openingTime.keys.elementAt(index),
                                style: TextStyle(fontSize: 20, color: isSelected[index] ? Colors.grey : Colors.black)
                            ),
                            onPressed: (){
                              setState(() {
                                print(index);
                                for(int i = 0; i < isSelected.length; i++){
                                  if(i == index){
                                    isSelected[i] = true;
                                  }else{
                                    isSelected[i] = false;
                                  }
                                }
                              });
                            }
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          heightSpace(context.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TimeField(),

              const Text("To", style: TextStyle(fontSize: 20)),
              Container(
                width: context.width * 0.2,
                height: context.height * 0.035,
                padding: EdgeInsets.only(top: 6, left: context.width * 0.04),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: const TextField(
                  style: TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '10:00 pm',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


