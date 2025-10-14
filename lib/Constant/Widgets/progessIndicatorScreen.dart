import 'package:flutter/material.dart';
import 'package:ticketfirst/Api/Helper/constant.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final List<String> steps;
  final ValueChanged<int>? onStepChanged;

  const StepIndicator({
    super.key,
    required this.currentStep,
    this.steps = const ['Venue', 'Date & Time', 'Package'],
    this.onStepChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(steps.length, (index) {
            return Row(
              children: [
                Radio<int>(
                  value: index,
                  groupValue: currentStep,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    if (value != null && onStepChanged != null) {
                      onStepChanged!(value);
                    }
                  },
                ),
                if (index < steps.length - 1)
                  _StepConnector(isActive: index < currentStep),
              ],
            );
          }),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(steps.length, (index) {
            final isActive = index == currentStep;
            return Row(
              children: [
                SizedBox(
                  width: 48,
                  child: Text(
                    steps[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isActive ? kPrimaryColor : Colors.black54,
                      fontWeight:
                          isActive ? FontWeight.bold : FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
                if (index < steps.length - 1) const SizedBox(width: 40),
              ],
            );
          }),
        ),
      ],
    );
  }
}

class _StepCircle extends StatelessWidget {
  final bool isActive;
  final String label;
  final int index;
  final int currentStep;
  final ValueChanged<int>? onStepChanged;

  const _StepCircle({
    required this.isActive,
    required this.label,
    required this.index,
    required this.currentStep,
    this.onStepChanged,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? kPrimaryColor : Colors.grey;

    return Column(
      children: [
        Radio<int>(
          value: index,
          groupValue: currentStep,
          onChanged: (value) {
            if (value != null && onStepChanged != null) {
              onStepChanged!(value);
            }
          },
          activeColor: kPrimaryColor,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: isActive ? kPrimaryColor : Colors.black54,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class _StepConnector extends StatelessWidget {
  final bool isActive;

  const _StepConnector({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 2,
      color: isActive ? kPrimaryColor : Colors.grey[300],
    );
  }
}

// class StepIndicator extends StatelessWidget {
//   final List<String> steps;
//   final int currentStep;

//   const StepIndicator({
//     required this.steps,
//     required this.currentStep,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: List.generate(steps.length, (index) {
//           bool isActive = index == currentStep;
//           bool isCompleted = index < currentStep;
//           return SizedBox(
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 CircleAvatar(
//                   radius: 9,
//                   backgroundColor:
//                       (isActive || isCompleted) ? Colors.black : Colors.grey,
//                   child: Text(
//                     '${index + 1}',
//                     style: TextStyle(
//                       color: Colors.white,
//                       // (isActive || isCompleted)
//                       //     ? Colors.white
//                       //     : Colors.black,
//                       fontWeight: FontWeight.normal,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 3),
//                 Text(
//                   steps[index],
//                   style: TextStyle(
//                     color:
//                         (isActive || isCompleted) ? Colors.black : Colors.grey,
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//                 if (index < steps.length - 1)
//                   Icon(
//                     Icons.chevron_right,
//                     size: 18,
//                     color: Colors.grey.shade400,
//                   ),
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
