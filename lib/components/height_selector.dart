import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_color.dart';
import 'package:flutter_application_1/core/text_style.dart';

class HeightSelector extends StatefulWidget {
  const HeightSelector({super.key});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  double height = 170.0; // Default height in cm
  int get heightInt => height.toInt();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            SizedBox(height: 8),
            Text("Altura".toUpperCase(),style: TextStyles.bodyText),
            Text("$heightInt cm", style:TextStyles.heightText),
            Slider(value: height, onChanged:(value){
              setState(() {
                height = value;
              });
            },
            min:90,
            max: 250,
            divisions: 160,
            label: "$heightInt cm",
            activeColor: AppColor.primary,)
          ],
        ),
      ),
    );
  }
}