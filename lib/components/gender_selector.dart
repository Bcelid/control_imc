import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_color.dart';
import 'package:flutter_application_1/core/text_style.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});
  
  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Hombre
        Expanded(
          child: GestureDetector(
            onTap: (){
              setState(() {
                selectedGender = "Hombre";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 16,left: 16,bottom: 16, right: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender == "Hombre" 
                  ? AppColor.backgroundComponentSelected 
                  : AppColor.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
              
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8),
                      Image.asset("assets/image/male.png", width: 50, height: 50),
                      Text("Hombre".toUpperCase(),
                        style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        //Mujer
        Expanded(
          child: GestureDetector(
            onTap: (){
              setState(() {
                selectedGender = "Mujer";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 16,left: 8,bottom: 16, right: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender == "Mujer" 
                  ? AppColor.backgroundComponentSelected 
                  : AppColor.backgroundComponent,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8),
                      Image.asset("assets/image/female.png", width: 50, height: 50),
                      Text("Mujer".toUpperCase(),
                        style: TextStyles.bodyText),
                  ],),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}