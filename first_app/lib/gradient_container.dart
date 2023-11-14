import 'package:flutter/material.dart';
import 'dice_roller.dart';

const Alignment startAlignment = Alignment.topLeft;
const Alignment endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
 const GradientContainer({super.key, required this.listOfColors});

  GradientContainer.purple({super.key})
      : listOfColors = [
          const Color.fromARGB(255, 148, 9, 195),
          const Color.fromARGB(255, 0, 116, 148)
        ];

  final List<Color> listOfColors;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: listOfColors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
