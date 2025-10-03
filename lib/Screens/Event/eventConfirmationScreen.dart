import 'package:flutter/material.dart';
import 'package:ticketfirst/Api/Helper/constant.dart';
import 'package:ticketfirst/Constant/Widgets/progessIndicatorScreen.dart';
import 'package:ticketfirst/Screens/Event/eventDateTimeConfirmationScreen.dart';

class EventConfirmationScreen extends StatefulWidget {
  final String title;
  const EventConfirmationScreen({super.key, required this.title});

  @override
  State<EventConfirmationScreen> createState() =>
      _EventConfirmationScreenState();
}

class _EventConfirmationScreenState extends State<EventConfirmationScreen> {
  String? expandedCity;
  bool showMoreDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child:

          //   StepIndicator(
          //     steps: [
          //       "Venue",
          //       "Date & Time",
          //       "Ticket",
          //       "Review & Proceed to Pay",
          //     ],
          //     currentStep: 0,
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Select Venue:",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
            ),
          ),
          venueCard(
            venueCity: "Nashik",
            onTap: () {
              setState(() {
                expandedCity = expandedCity == "Nashik" ? null : "Nashik";
                showMoreDetails = false;
              });
            },
            isExpanded: expandedCity == "Nashik",
            expandedChild: venueDetailsCard(
              venueAddress:
                  "Nashik City Centre Mall, Untwadi Road Lavate Nagar, Nashik, Maharashtra",
              timing: "Event Timing: 7:00 PM - 10:00 PM",
              description:
                  "College Road, Shahid circle, East Nashik"
                  "View on Map",
              showMore: showMoreDetails,
              onKnowMoreTap: () {
                setState(() {
                  showMoreDetails = !showMoreDetails;
                });
              },
              onAddressTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => EventDatetimeConfirmationScreen(
                          title: "Kisi Ko Batana Mat Ft. Anubhav Singh Bassi",
                          venueAddress:
                              "City Centre Mall Untwadi Road, Nashik, Maharashtra",
                          timing: "Event Timing: 7:00 PM - 10:00 PM",
                        ),
                  ),
                );
              },
            ),
          ),

          // venueCard(
          //   venueCity: "Mumbai",
          //   onTap: () {
          //     setState(() {
          //       expandedCity = expandedCity == "Mumbai" ? null : "Mumbai";
          //       showMoreDetails = false;
          //     });
          //   },
          //   isExpanded: expandedCity == "Mumbai",
          //   expandedChild: venueDetailsCard(
          //     venueAddress: "Bandra Kurla Complex, Mumbai",
          //     showMore: showMoreDetails,
          //     onKnowMoreTap: () {
          //       setState(() {
          //         showMoreDetails = !showMoreDetails;
          //       });
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  /// Venue card with expand/collapse
  Widget venueCard({
    required String venueCity,
    required VoidCallback onTap,
    required bool isExpanded,
    Widget? expandedChild,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: const BoxDecoration(color: Colors.white70),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        venueCity,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.black54,
                      size: 28,
                    ),
                  ],
                ),
              ),
              if (isExpanded && expandedChild != null) expandedChild,
            ],
          ),
        ),
      ),
    );
  }

  Widget venueDetailsCard({
    required String venueAddress,
    required String timing,
    required String description,
    required bool showMore,
    required VoidCallback onAddressTap,
    required VoidCallback onKnowMoreTap,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
      ),
      child: InkWell(
        onTap: onAddressTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              venueAddress,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 6),
            Text(
              timing,
              style: const TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 10),

            InkWell(
              onTap: onKnowMoreTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    showMore ? "Know Less" : "Know More",
                    style: const TextStyle(
                      fontSize: 14,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Divider(),
                  Icon(
                    showMore
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
            if (showMore) ...[
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 13, color: Colors.black87),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
