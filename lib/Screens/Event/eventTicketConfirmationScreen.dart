import 'package:flutter/material.dart';
import 'package:ticketfirst/Api/Helper/constant.dart';
import 'package:ticketfirst/Constant/Widgets/progessIndicatorScreen.dart';
import 'package:ticketfirst/Screens/Event/mTicketScreen.dart';

class EventTicketConfirmationScreen extends StatefulWidget {
  final String title;
  final String timing;
  final String venueAddress;

  const EventTicketConfirmationScreen({
    super.key,
    required this.title,
    required this.timing,
    required this.venueAddress,
  });

  @override
  State<EventTicketConfirmationScreen> createState() =>
      _EventTicketConfirmationScreenState();
}

class _EventTicketConfirmationScreenState
    extends State<EventTicketConfirmationScreen> {
  int count = 0;
  bool isButtonEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepIndicator(
              steps: [
                "Venue",
                "Date & Time",
                "Ticket",
                "Review & Proceed to Pay",
              ],
              currentStep: 2,
            ),
            SizedBox(height: 10),
            // Venue Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.venueAddress,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.timing,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            // Section Title
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Tickets",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "You can add up to 10 tickets only",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            // Ticket Options
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  // First Card with counter/add logic
                  ticketOptionCard(
                    title: "BALCONY 2ND DECK",
                    subtitle: "₹999",
                    count: count,
                    onAdd: () {
                      setState(() {
                        count = 1;
                        isButtonEnabled = true;
                      });
                    },
                    onIncrement: () {
                      setState(() {
                        if (count < 10) count++;
                        isButtonEnabled = true;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        if (count > 1) {
                          count--;
                        } else {
                          count = 0;
                          isButtonEnabled = false;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),

            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed:
                    isButtonEnabled
                        ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => MTicketScreen(
                                    title: widget.title,
                                    timing: widget.timing,
                                    venueAddress: widget.venueAddress,
                                  ),
                            ),
                          );
                        }
                        : null,
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

  Widget ticketOptionCard({
    required String title,
    required String subtitle,
    required int count,
    required VoidCallback onAdd,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                ],
              ),
            ),
            // Right Section for Add or Counter
            SizedBox(
              height: 36,
              child:
                  count == 0
                      ? OutlinedButton(
                        onPressed: onAdd,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: kPrimaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 18),
                        ),
                        child: Text(
                          "Add",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                      : Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove, color: kPrimaryColor),
                              onPressed: onDecrement,
                              splashRadius: 18,
                            ),
                            Text(
                              count.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add, color: kPrimaryColor),
                              onPressed: onIncrement,
                              splashRadius: 18,
                            ),
                          ],
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
