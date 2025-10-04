import 'package:flutter/material.dart';
import 'package:ticketfirst/Api/Helper/constant.dart';
import 'package:ticketfirst/Screens/Event/eventConfirmationScreen.dart';
import 'package:ticketfirst/Screens/Event/knowMoreInfoScreen.dart';
import 'package:ticketfirst/Screens/Event/mTicketScreen.dart';

class ComedyShowsScreen extends StatefulWidget {
  const ComedyShowsScreen({super.key});

  @override
  State<ComedyShowsScreen> createState() => _ComedyShowsScreenState();
}

class _ComedyShowsScreenState extends State<ComedyShowsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          "Comedy Shows",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.10),
          child: Padding(
            padding: const EdgeInsets.only(left: 70, bottom: 8.0),
            child: Row(
              children: [
                Text("College Road Nashik | "),
                const Divider(height: 5),
                Text("10 Events"),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(color: Colors.white, width: 1),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {},
                  child: const Text("Filters", style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(color: Colors.white, width: 1),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {},
                  child: const Text("Sort By", style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(color: Colors.white, width: 1),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Browse By Venues",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // const Text(
                    //   "Upcoming Events",
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    Row(
                      children: [
                        eventCard(
                          imageUrl:
                              'assets/images/acd5488e27bb1f7e741ed109d8554c5209cf907a.png',
                          dateText: 'Fri, 24 Oct onwards',
                          title: 'Papa Yaar by Zakir Khan',
                          location:
                              'Pandit Dindayal Upadhyay Nagargruh: Vad...',
                          description: 'Stand up Comedy',
                          onTap: () {
                            showBottomDialog(
                              context: context,
                              imageUrl:
                                  'assets/images/acd5488e27bb1f7e741ed109d8554c5209cf907a.png',
                              title:
                                  'Kisi Ko Batana Mat Ft. Anubhav Singh Bassi',
                              description:
                                  'After the great success of his previous show... This time, he will bring a whole new set of funny...',
                              date: 'Fri, Oct 24, 2025 | 07:00 PM',
                              location: 'Nashik: CCM Mall... | 2.3Km',
                              onKnowMore: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => KnowMoreInfoScreen(
                                          imageUrl:
                                              "assets/images/acd5488e27bb1f7e741ed109d8554c5209cf907a.png",
                                          title:
                                              "Kisi Ko Batana Mat Ft. Anubhav Singh Bassi",
                                        ),
                                  ),
                                );
                              },
                              onBookNow: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => EventConfirmationScreen(
                                          title: "title",
                                        ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        eventCard(
                          imageUrl:
                              'assets/images/00616f4e863684eebc1eb43dae2ef8a170cbb5b6.png',
                          dateText: 'Fri, 24 Oct onwards',
                          title: 'Papa Yaar by Zakir Khan',
                          location:
                              'Pandit Dindayal Upadhyay Nagargruh: Vad...',
                          description: 'Stand up Comedy',
                          onTap: () {},
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        eventCard(
                          imageUrl:
                              'assets/images/11f0f75b4d3c66b1ac9179f104ab7384b31efeac.png',
                          dateText: 'Fri, 24 Oct onwards',
                          title: 'Papa Yaar by Zakir Khan',
                          location:
                              'Pandit Dindayal Upadhyay Nagargruh: Vad...',
                          description: 'Stand up Comedy',
                          onTap: () {},
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        eventCard(
                          imageUrl:
                              'assets/images/acd5488e27bb1f7e741ed109d8554c5209cf907a.png',
                          dateText: 'Fri, 24 Oct onwards',
                          title: 'Papa Yaar by Zakir Khan',
                          location:
                              'Pandit Dindayal Upadhyay Nagargruh: Vad...',
                          description: 'Stand up Comedy',
                          onTap: () {},
                        ),
                        eventCard(
                          imageUrl:
                              'assets/images/00616f4e863684eebc1eb43dae2ef8a170cbb5b6.png',
                          dateText: 'Fri, 24 Oct onwards',
                          title: 'Papa Yaar by Zakir Khan',
                          location:
                              'Pandit Dindayal Upadhyay Nagargruh: Vad...',
                          description: 'Stand up Comedy',
                          onTap: () {},
                        ),
                      ],
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

  Widget eventCard({
    required String imageUrl,
    required String dateText,
    required String title,
    required String location,
    required String description,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 175,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
                bottom: Radius.circular(16),
              ),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                height: 220,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 8),
            // Date
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8.0),
                bottom: Radius.circular(8.0),
              ),
              child: Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 230, 242, 248),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  dateText,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  // Location
                  Text(
                    location,
                    style: TextStyle(color: Colors.black, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6),
                  // Description
                  Text(
                    description,
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showBottomDialog({
    required BuildContext context,
    required String imageUrl,
    required String title,
    required String description,
    required String location,
    required String date,
    required VoidCallback onKnowMore,
    required VoidCallback onBookNow,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // makes it take full height if needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              // Image at the top
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(imageUrl, height: 160, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    ),

                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.currency_rupee,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: onKnowMore,
                            child: Text('Know More'),
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              side: BorderSide(color: Colors.pink),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: onBookNow,
                            child: Text('Book Now'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
