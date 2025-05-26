import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/gender_selector.dart';
import 'package:flutter_application_1/components/height_selector.dart';
import 'package:flutter_application_1/components/number_selector.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 20;
  int selectedWeight = 20;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(),
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
      ],
    );
  }
}
