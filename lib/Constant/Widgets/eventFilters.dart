import 'package:flutter/material.dart';
import 'package:ticketfirst/Api/Helper/constant.dart';

// Define primary color globally for reuse

class EventFilterWidget extends StatefulWidget {
  const EventFilterWidget({super.key});

  @override
  EventFilterWidgetState createState() => EventFilterWidgetState();
}

class EventFilterWidgetState extends State<EventFilterWidget> {
  // Keep track of selected buttons
  final Set<String> _selectedButtons = {};

  // Reusable button creation method
  Widget _buildCategoryButton(String text, VoidCallback onPressed) {
    bool isSelected = _selectedButtons.contains(text);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? kPrimaryColor : Colors.white, // Primary color on tap
        foregroundColor:
            isSelected
                ? Colors.white
                : kPrimaryColor, // Text white when selected
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
      ),
      onPressed: () {
        setState(() {
          if (isSelected) {
            _selectedButtons.remove(text); // Deselect on tap
          } else {
            _selectedButtons.add(text); // Select on tap
          }
          onPressed(); // Custom onPressed behavior
        });
      },
      child: Text(text, style: const TextStyle(fontSize: 18)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            SizedBox(height: 8.0),
            _buildCategoryTitle(context, "All Categories"),

            // First Wrap of Buttons
            Wrap(
              spacing: 8.0,
              children: [
                _buildCategoryButton("Entertainments", () {}),
                _buildCategoryButton("Sports & Fitness", () {}),
                _buildCategoryButton("Festivals & Cultures", () {}),
                _buildCategoryButton("Workshops & Learning", () {}),
              ],
            ),

            SizedBox(height: 8.0),

            // Title Section for Sub Categories
            _buildCategoryTitle(context, "Sub Categories"),

            // Second Wrap of Buttons
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _buildCategoryButton("Stand-up", () {}),
                _buildCategoryButton("Theatre", () {}),
                _buildCategoryButton("Music Festivals", () {}),
                _buildCategoryButton("Circus", () {}),
              ],
            ),

            SizedBox(height: 8.0),

            // Title Section for Language
            _buildCategoryTitle(context, "Language"),

            // Third Wrap of Buttons
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _buildCategoryButton("English", () {}),
                _buildCategoryButton("Hindi", () {}),
                _buildCategoryButton("Marathi", () {}),
                _buildCategoryButton("Others", () {}),
              ],
            ),

            SizedBox(height: 8.0),

            // Title Section for Price
            _buildCategoryTitle(context, "Price"),

            // Fourth Wrap of Buttons
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _buildCategoryButton("1000", () {}),
                _buildCategoryButton("1500", () {}),
                _buildCategoryButton("2000", () {}),
                _buildCategoryButton("3000", () {}),
              ],
            ),

            SizedBox(height: 8.0),

            // Title Section for Date
            _buildCategoryTitle(context, "Date"),

            // Fifth Wrap of Buttons
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _buildCategoryButton("2023", () {}),
                _buildCategoryButton("2024", () {}),
                _buildCategoryButton("All Dates", () {}),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Apply Filters'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Method to build the category title text
  Widget _buildCategoryTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
