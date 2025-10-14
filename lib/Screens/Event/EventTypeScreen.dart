import 'package:flutter/material.dart';
import 'package:ticketfirst/Api/Helper/constant.dart';
import 'package:ticketfirst/Constant/Widgets/discoverCard.dart';
import 'package:ticketfirst/Constant/Widgets/searchField.dart';
import 'package:ticketfirst/Screens/Event/eventConfirmationScreen.dart';
import 'package:ticketfirst/Screens/Event/knowMoreInfoScreen.dart';

class EventTypeScreen extends StatefulWidget {
  const EventTypeScreen({super.key});

  @override
  State<EventTypeScreen> createState() => _EventTypeScreenState();
}

class _EventTypeScreenState extends State<EventTypeScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Entertainment',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchField(
              controller: _searchController,
              hintText: 'Search for events, shows...',
              onChanged: (value) {},
              onClear: () {
                _searchController.clear();
              },
            ),
            SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DiscoverCard(
                          title: 'Stand-ups',
                          imagePath:
                              'assets/images/4e9fb3293f3af2e8f28462df14c453156ab3fee4.jpg',
                          onTap: () {},
                        ),
                        DiscoverCard(
                          imagePath:
                              'assets/images/4ac18002138c7c72e0ac255e11cd5b49109cc9e1.jpg',
                          title: 'Theatre',
                          onTap: () {},
                        ),
                        DiscoverCard(
                          imagePath:
                              'assets/images/b43ee5c55e41fe9f7e35b95b7ad926a02c3a03e6.jpg',
                          title: 'Music Festivals',
                          onTap: () {},
                        ),
                        DiscoverCard(
                          imagePath:
                              'assets/images/7987c937bda24ec750a2e06043e757f855225d10.jpg',
                          title: 'Circus',
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),

                    Row(
                      children: [
                        eventCard(
                          imageUrl:
                              'assets/images/acd5488e27bb1f7e741ed109d8554c5209cf907a.png',
                          dateText: 'Fri, 24 Oct',
                          title: 'Dupont-therapy',
                          location: 'Nashik',
                          description: 'Stand up Comedy',
                          isSaved: isSaved,
                          onSaveToggle: () {
                            setState(() {
                              isSaved = !isSaved;
                            });
                          },
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
                          title: 'Papa Yaar by Zakir Khan',
                          location: 'Mumbai',
                          description: 'Stand up Comedy',
                          dateText: 'Fri, 24 Oct onwards',
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
                          location: 'Nashik',
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
    bool isSaved = false,
    VoidCallback? onSaveToggle,
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
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                height: 220,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (onSaveToggle != null)
                        GestureDetector(
                          onTap: onSaveToggle,
                          child: Icon(
                            isSaved ? Icons.bookmark : Icons.bookmark_border,
                            color: isSaved ? Colors.redAccent : Colors.grey,
                            size: 22,
                          ),
                        ),
                    ],
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

                  // Date
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8.0),
                      bottom: Radius.circular(8.0),
                    ),
                    child: Container(
                      width: double.infinity,
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
