import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_color.dart';
import 'package:flutter_application_1/core/text_style.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int peso;
  final int age;
  const ImcResultScreen({
    super.key,
    required this.height,
    required this.peso,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: toolbarResult(),
      body: bodyResult(context),
    );
  }

  double calculateImc(peso, height) {
    // Implementación del cálculo del IMC
    // IMC = peso / (altura * altura)
    double imc = peso / ((height / 100) * (height / 100));
    return (imc);
  }

  Padding bodyResult(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tu Resultado:", style: TextStyles.heightText),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(getTitleByImc(), style: TextStyle(color:getColorByImc(calculateImc(peso, height)),fontSize: 30, fontWeight: FontWeight.bold)),                      
                      Text(calculateImc(peso, height).toStringAsFixed(2), style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white)), 
                      Text(getDesciptionByImc(), style: TextStyles.bodyText),
                    ],
                  ),
                ),
                 
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                Navigator.pop(context);
              },style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(AppColor.primary),
                  ), child: Text("Finalizar", style: TextStyles.bodyText)),
            ),
          ),
        ],
        
      ),
    );
  }

  String getTitleByImc() {
    double imcResult = calculateImc(peso, height);
    return switch(imcResult){
      < 18.5 => "Bajo peso",
      < 24.9 => "Peso normal",
      < 29.9 => "Sobrepeso",
      < 34.9 => "Obesidad grado 1",
      < 39.9 => "Obesidad grado 2",
      _ => "Obesidad grado 3",
    };
  }

  String getDesciptionByImc() {
    double imcResult = calculateImc(peso, height);
    return switch(imcResult){
      < 18.5 => "Tu IMC indica que tienes un bajo peso. Es importante mantener una dieta equilibrada y consultar a un profesional de la salud si es necesario.",
      < 24.9 => "Tu IMC está en el rango normal. ¡Buen trabajo! Mantén un estilo de vida saludable.",
      < 29.9 => "Tu IMC indica sobrepeso. Considera hacer ajustes en tu dieta y aumentar tu actividad física.",
      < 34.9 => "Tu IMC indica obesidad grado 1. Es recomendable consultar a un profesional de la salud para recibir orientación.",
      < 39.9 => "Tu IMC indica obesidad grado 2. Es importante buscar ayuda profesional para mejorar tu salud.",
      _ => "Tu IMC indica obesidad grado 3. Es crucial consultar a un médico para recibir un plan de tratamiento adecuado.",
    };
  }

  Color getColorByImc(double imcResult){
    return switch(imcResult){
      < 18.5 => Colors.blue, // Bajo peso
      < 24.9 => Colors.green, // Peso normal
      < 29.9 => Colors.yellow, // Sobrepeso
      < 34.9 => Colors.orange, // Obesidad grado 1
      < 39.9 => Colors.red, // Obesidad grado 2
      _ => Colors.purple, // Obesidad grado 3
    };
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text("Resultado IMC"),
      backgroundColor: AppColor.primary,
      foregroundColor: Colors.white,
    );
  }
}
