import 'package:flutter/material.dart';
import 'package:ticketfirst/Api/Helper/constant.dart';
import 'package:ticketfirst/Screens/Event/eventTicketConfirmationScreen.dart';

class EventDatetimeConfirmationScreen extends StatefulWidget {
  final String title;
  final String venueAddress;
  final String? timing;
  const EventDatetimeConfirmationScreen({
    super.key,
    required this.title,
    required this.venueAddress,
    this.timing,
  });

  @override
  State<EventDatetimeConfirmationScreen> createState() =>
      _EventDatetimeConfirmationScreenState();
}

class _EventDatetimeConfirmationScreenState
    extends State<EventDatetimeConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.venueAddress,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(height: 10),
            dateTimeSelector(
              selectedDate: "Fri 24 Oct",
              selectedTime: "07:00 PM",
              onDateTap: () {},
              onTimeTap: () {},
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => EventTicketConfirmationScreen(
                            title: "Kisi Ko Batana Mat Ft. Anubhav Singh Bassi",
                            venueAddress:
                                "City Centre Mall Untwadi Road, Nashik, Maharashtra",
                            timing: "Event Timing: 7:00 PM - 10:00 PM",
                          ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Proceed',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget statusIndicator({required Color color}) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget selectionButton({
    required String text,
    bool selected = false,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: 130,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: selected ? Colors.green : Colors.grey[300],
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget dateTimeSelector({
    required String selectedDate,
    required String selectedTime,
    required VoidCallback? onDateTap,
    required VoidCallback? onTimeTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Legend Row
            Row(
              children: [
                statusIndicator(color: Colors.green),
                Text("Available"),
                SizedBox(width: 14),
                statusIndicator(color: Colors.orange),
                Text("Fast Filling"),
                SizedBox(width: 14),
                statusIndicator(color: Colors.grey),
                Text("Sold out"),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Select Date",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            selectionButton(
              text: selectedDate,
              selected: true,
              onTap: onDateTap,
            ),
            SizedBox(height: 14),
            Text(
              "Select Time",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            selectionButton(
              text: selectedTime,
              selected: true,
              onTap: onTimeTap,
            ),
          ],
        ),
      ),
    );
  }
}
