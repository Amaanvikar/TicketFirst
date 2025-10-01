// Import required packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketfirst/Api/Helper/constant.dart';

// Providers for state management
final adultsProvider = StateProvider<int>((ref) => 1);
final childrenProvider = StateProvider<int>((ref) => 1);
final infantProvider = StateProvider<int>((ref) => 1);
final cabinProvider = StateProvider<String>((ref) => 'Economy/Premium Economy');

// Widget to open dialog from icon
class TravellerTextField extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Select Traveller and Class',
        suffixIcon: IconButton(
          icon: Icon(Icons.people),
          onPressed:
              () => showDialog(
                context: context,
                builder: (context) => TravellerDialog(),
              ),
        ),
      ),
    );
  }
}

// Traveller Dialog Widget
class TravellerDialog extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adults = ref.watch(adultsProvider);
    final children = ref.watch(childrenProvider);
    final infant = ref.watch(infantProvider);
    final cabin = ref.watch(cabinProvider);

    Widget travellerRow(
      String label,
      String subtitle,
      StateProvider<int> provider,
      int min,
    ) {
      final value = ref.watch(provider);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed:
                    value > min
                        ? () => ref.read(provider.notifier).state--
                        : null,
              ),
              Text('$value'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => ref.read(provider.notifier).state++,
              ),
            ],
          ),
        ],
      );
    }

    Widget cabinButton(String classes) {
      final selected = cabin == classes;
      return Padding(
        padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: selected ? kPrimaryColor : Colors.white,
          ),
          child: Text(
            classes,
            style: TextStyle(color: selected ? Colors.white : Colors.black),
          ),
          onPressed: () => ref.read(cabinProvider.notifier).state = classes,
        ),
      );
    }

    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Traveller and Class',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Add Number of travellers'),
              ),
              SizedBox(height: 10),
              travellerRow(
                'Adults',
                '12 yrs & above\nOn the day of travel',
                adultsProvider,
                1,
              ),
              travellerRow(
                'Children',
                '2-12 yrs\nOn the day of travel',
                childrenProvider,
                0,
              ),
              travellerRow(
                'Infant',
                'Under 2 yrs\nOn the day of travel',
                infantProvider,
                0,
              ),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Choose Cabin Class'),
              ),
              SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  cabinButton('Economy/Premium Economy'),
                  cabinButton('Premium Economy'),
                ],
              ),
              Row(
                children: [
                  cabinButton('Business Class'),
                  cabinButton('First Class'),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                  child: Text('DONE', style: TextStyle(color: Colors.white)),
                  onPressed: () => Navigator.pop(context, {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
