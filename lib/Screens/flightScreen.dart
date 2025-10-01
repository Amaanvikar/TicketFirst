import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ticketfirst/Api/Helper/constant.dart';
import 'package:ticketfirst/Screens/travellerClassScreen.dart';

// StateNotifier to manage trip selection
class TripSelectionNotifier extends StateNotifier<String> {
  TripSelectionNotifier() : super("One Way");

  void selectTrip(String trip) {
    state = trip;
  }
}

// Riverpod provider for trip selection
final tripSelectionProvider =
    StateNotifierProvider<TripSelectionNotifier, String>(
      (ref) => TripSelectionNotifier(),
    );

class FlightScreen extends ConsumerWidget {
  FlightScreen({super.key});

  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController returnDateController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController passengerController = TextEditingController();
  final TextEditingController departureController = TextEditingController();

  final DateFormat _dateFormat = DateFormat('dd MMM yyyy');

  Future<void> _pickDate(
    BuildContext context,
    TextEditingController controller, {
    DateTime? firstDate,
    DateTime? initialDate,
    DateTime? lastDate,
  }) async {
    final now = DateTime.now();
    final initial = initialDate ?? now;
    final first = firstDate ?? DateTime(now.year - 1);
    final last = lastDate ?? DateTime(now.year + 5);

    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: first,
      lastDate: last,
    );

    if (picked != null) {
      controller.text = _dateFormat.format(picked);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTrip = ref.watch(tripSelectionProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Flight Screen",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            children: [
              // Trip Selection Row
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildTripButton("One Way", selectedTrip, ref),
                  const SizedBox(width: 12),
                  _buildTripButton("Round Trip", selectedTrip, ref),
                ],
              ),
              SizedBox(height: 10),

              // Text Fields for flight details
              _buildTextField(
                "From",
                fromController,
                isPrefixIcon: true,
                icon: Icons.flight_takeoff,
              ),
              _buildTextField(
                "To",
                toController,
                isPrefixIcon: true,
                icon: Icons.flight_land_outlined,
              ),
              _buildTextField(
                "Departure",
                departureController,
                icon: Icons.calendar_month,
                readOnly: true,
                onTap: () => _pickDate(context, departureController),
              ),
              if (selectedTrip == "Round Trip")
                _buildTextField(
                  "Add Return Date",
                  returnDateController,
                  icon: Icons.calendar_month,
                  readOnly: true,
                  onTap:
                      () => _pickDate(
                        context,
                        returnDateController,
                        firstDate: DateTime.now(),
                        initialDate:
                            departureController.text.isNotEmpty
                                ? _dateFormat.parse(departureController.text)
                                : DateTime.now(),
                      ),
                ),
              _buildTextField(
                "Class",
                classController,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => TravellerDialog(),
                  );
                },
              ),
              _buildTextField(
                "Passenger",
                passengerController,
                icon: Icons.arrow_right,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => TravellerDialog(),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Search Flight Button
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Search Flight",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Image Cards for Offers or Promotions
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildImageCard(
                      "assets/images/fd5763a28561f921c91b3d57c69fe4f2adca0798.jpg",
                    ),
                    const SizedBox(width: 12),
                    _buildImageCard(
                      "assets/images/371b0d2f3f441db53cc3851574262c585961ae6d.jpg",
                    ),
                    const SizedBox(width: 12),
                    _buildImageCard(
                      "assets/images/fd5763a28561f921c91b3d57c69fe4f2adca0798.jpg",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Trip button
  Widget _buildTripButton(String title, String selectedTrip, WidgetRef ref) {
    bool isSelected = selectedTrip == title;

    return GestureDetector(
      onTap: () {
        ref.read(tripSelectionProvider.notifier).selectTrip(title);
      },
      child: Column(
        children: [
          // Circular Button without icon
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: kPrimaryColor, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
            ),
            child:
                isSelected
                    ? Center(
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                    : null,
          ),

          const SizedBox(height: 8),
          // Label below the button
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.redAccent : Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Image card
  Widget _buildImageCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Image.asset(
          imagePath,
          width: 300,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Text field
  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    VoidCallback? onTap,
    IconData? icon,
    bool isPrefixIcon = false,
    bool readOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          prefixIcon:
              isPrefixIcon
                  ? GestureDetector(onTap: onTap, child: Icon(icon))
                  : null,
          suffixIcon:
              !isPrefixIcon
                  ? GestureDetector(onTap: onTap, child: Icon(icon))
                  : null,
        ),
        keyboardType: TextInputType.text,
        style: const TextStyle(fontWeight: FontWeight.bold),
        validator:
            (value) => value == null || value.isEmpty ? 'Required' : null,
      ),
    );
  }
}
