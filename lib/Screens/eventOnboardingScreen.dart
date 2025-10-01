import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketfirst/Api/Helper/constant.dart';

class EventOnBoardingScreen extends ConsumerWidget {
  EventOnBoardingScreen({super.key});

  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController returnDateController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController passengerController = TextEditingController();
  final TextEditingController departureController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Event Onboarding",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            children: [
              _buildTextField(
                "From",
                fromController,
                isPrefixIcon: true,
                icon: Icons.flight_takeoff,
                onTap: () {},
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
              ),
              _buildTextField(
                "Add Return Date",
                returnDateController,
                icon: Icons.calendar_month,
              ),
              _buildTextField("Class", classController),
              _buildTextField(
                "Passenger",
                passengerController,
                icon: Icons.arrow_right,
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
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

  Widget _buildImageCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 4),
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

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    // bool hasTrailingIcon = false,
    VoidCallback? onTap,
    IconData? icon,
    bool isPrefixIcon = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontWeight: FontWeight.bold), // label text bold
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
