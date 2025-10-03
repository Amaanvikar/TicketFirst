import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final List<String> steps;
  final int currentStep;

  const StepIndicator({
    required this.steps,
    required this.currentStep,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: List.generate(steps.length, (index) {
          bool isActive = index == currentStep;
          bool isCompleted = index < currentStep;
          return SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 9,
                  backgroundColor:
                      (isActive || isCompleted) ? Colors.black : Colors.grey,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: Colors.white,
                      // (isActive || isCompleted)
                      //     ? Colors.white
                      //     : Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 3),
                Text(
                  steps[index],
                  style: TextStyle(
                    color:
                        (isActive || isCompleted) ? Colors.black : Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                if (index < steps.length - 1)
                  Icon(
                    Icons.chevron_right,
                    size: 18,
                    color: Colors.grey.shade400,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
