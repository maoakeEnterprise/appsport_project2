import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class NutritionPage extends StatefulWidget {
  const NutritionPage({Key? key}) : super(key: key);

  @override
  State<NutritionPage> createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {

  final apiKey = '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';
  late OpenAI openAI;

  @override
  void initState(){
    openAI = OpenAI.instance.build(token: apiKey,isLogger: true);
    super.initState();
  }
  @override
  void dipose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nutrition"),
      ),
    );
  }
}
