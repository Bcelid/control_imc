import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/gender_selector.dart';
import 'package:flutter_application_1/components/height_selector.dart';
import 'package:flutter_application_1/components/number_selector.dart';
import 'package:flutter_application_1/core/app_color.dart';
import 'package:flutter_application_1/core/text_style.dart';
import 'package:flutter_application_1/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 20;
  int selectedWeight = 20;
  double selectedHeight = 170.0; // Default height in cm

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(
          selectedHeight: selectedHeight,
          onHeightChanged: (newheight) {
            setState(() {
              selectedHeight = newheight;
            });
          },
        ),
        Row(
          children: [
            Expanded(
              child: NumberSelector(
                title: "EDAD",
                value: selectedAge,
                onIncrement: () {
                  setState(() {
                    selectedAge++;
                  });
                },
                onDecrement: () {
                  setState(() {
                    selectedAge--;
                  });
                },
              ),
            ),
            Expanded(
              child: NumberSelector(
                title: "PESO",
                value: selectedWeight,
                onIncrement: () {
                  setState(() {
                    selectedWeight++;
                  });
                },
                onDecrement: () {
                  setState(() {
                    selectedWeight--;
                  });
                },
              ),
            ),
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => ImcResultScreen(
                  height: selectedHeight,
                  peso: selectedWeight,
                  age: selectedAge,
                )));
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColor.primary),
              ),
              child: Text("CALCULAR IMC", style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}
