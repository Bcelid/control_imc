import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_color.dart';
import 'package:flutter_application_1/core/text_style.dart';

class NumberSelector extends StatefulWidget {
  final String title;
  final int value;
  final Function() onIncrement;
  final Function() onDecrement;
  const NumberSelector({super.key, required this.title,required this.onDecrement, required this.onIncrement, required this.value});

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
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
            Padding(
              padding: const EdgeInsets.only(bottom: 14.0),
              child: Text(widget.title, style: TextStyles.bodyText),
            ),
            Text(widget.value.toString(), style: TextStyles.heightText),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom:16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: (){
                      widget.onDecrement();
                    }, 
                    shape: CircleBorder(),
                    backgroundColor: AppColor.primary,
                    child: Icon(Icons.remove, color: Colors.white, size: 30),
                  ),
                  SizedBox(width: 16),
                  FloatingActionButton(
                    onPressed: (){
                      widget.onIncrement();
                    }, 
                    shape: CircleBorder(),
                    backgroundColor: AppColor.primary,
                    child: Icon(Icons.add, color: Colors.white, size: 30),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}