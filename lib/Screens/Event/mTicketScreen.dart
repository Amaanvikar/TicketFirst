import 'package:flutter/material.dart';
import 'package:ticketfirst/Api/Helper/constant.dart';
import 'package:ticketfirst/Constant/Widgets/progessIndicatorScreen.dart';
import 'package:ticketfirst/Screens/Event/eventBookingScreen.dart';

class MTicketScreen extends StatefulWidget {
  final String title;
  final String timing;
  final String venueAddress;
  const MTicketScreen({
    super.key,
    required this.title,
    required this.timing,
    required this.venueAddress,
  });

  @override
  State<MTicketScreen> createState() => _MTicketScreenState();
}

class _MTicketScreenState extends State<MTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text(
                    "Your selected seats will be unblocked and may not be available later if you cancle!",
                    style: TextStyle(fontSize: 18),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Text('Yes, Cancel'),
                    ),
                  ],
                );
              },
            );
          },
        ),
        title: Text(
          "Confirm Tickets",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // StepIndicator(
            //   steps: [
            //     "Venue",
            //     "Date & Time",
            //     "Ticket",
            //     "Review & Proceed to Pay",
            //   ],
            //   currentStep: 3,
            // ),
            SizedBox(height: 10),
            // M-Ticket Card
            CommonCard(
              title: Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: true,
                    onChanged: (_) {},
                    activeColor: kPrimaryColor,
                  ),
                  Text(
                    'M-Ticket',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.eco, color: Colors.green, size: 20),
                  SizedBox(width: 4),
                  Text(
                    "Save the planet. Use your phone as a ticket.",
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                ],
              ),
              content: Container(
                color: Color(0xffeaf1fb),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "M-Ticket Information",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "1. Customer(s) can access their ticket(s) from the 'My Profile' section on the app/mobile-web.",
                    ),
                    Text(
                      "2. It is mandatory to present the ticket(s) in my profile section via app/mobile-web at the venue.",
                    ),
                    Text(
                      "3. No physical ticket(s) are required to enter the venue.",
                    ),
                  ],
                ),
              ),
            ),
            // Ticket Details Card
            CommonCard(
              title: Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.timing),
                  Text("Venue"),
                  Text(
                    widget.venueAddress,
                    style: TextStyle(color: Colors.black87),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "BALCONY 2ND DECK(999): 1 ticket(s)",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Sub-total"), Text("₹999.00")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Booking Fee"), Text("₹94.30")],
                  ),
                  SizedBox(height: 8),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Amount",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "₹1,093.30",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: "Maharashtra",
                    items:
                        ["Maharashtra", "Delhi", "Karnataka"]
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                    onChanged: (value) {},
                    decoration: InputDecoration(labelText: "Select State"),
                  ),
                ],
              ),
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
                      builder: (context) => EventBookingScreen(),
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
                  'Proceed To Pay',
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

  Widget CommonCard({required Widget title, required Widget content}) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [title, SizedBox(height: 10), Divider(), content],
        ),
      ),
    );
  }
}
