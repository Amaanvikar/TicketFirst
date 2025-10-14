import 'package:flutter/material.dart';
import 'package:ticketfirst/Api/Helper/constant.dart';
import 'package:ticketfirst/Constant/Widgets/searchField.dart';
import 'package:ticketfirst/Screens/Event/EventTypeScreen.dart';
import 'package:ticketfirst/Screens/Event/eventConfirmationScreen.dart';
import 'package:ticketfirst/Screens/Event/knowMoreInfoScreen.dart';

class ComedyShowsScreen extends StatefulWidget {
  const ComedyShowsScreen({super.key});

  @override
  State<ComedyShowsScreen> createState() => _ComedyShowsScreenState();
}

class _ComedyShowsScreenState extends State<ComedyShowsScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isSaved = false;
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
            SearchField(
              controller: _searchController,
              hintText: 'Search for events, shows...',
              onChanged: (value) {},
              onClear: () {
                _searchController.clear();
              },
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Categories",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildDiscoverCard(
                          imagePath:
                              'assets/images/4e9fb3293f3af2e8f28462df14c453156ab3fee4.jpg',
                          title: 'Stand-ups',
                          onTap: () {},
                        ),
                        _buildDiscoverCard(
                          imagePath:
                              'assets/images/4ac18002138c7c72e0ac255e11cd5b49109cc9e1.jpg',
                          title: 'Theatre',
                          onTap: () {},
                        ),
                        _buildDiscoverCard(
                          imagePath:
                              'assets/images/b43ee5c55e41fe9f7e35b95b7ad926a02c3a03e6.jpg',
                          title: 'Music Festivals',
                          onTap: () {},
                        ),
                        _buildDiscoverCard(
                          imagePath:
                              'assets/images/7987c937bda24ec750a2e06043e757f855225d10.jpg',
                          title: 'Circus',
                          onTap: () {},
                        ),

                        //  _buildDiscoverCard(
                        //   imagePath:
                        //       'assets/images/546d96206609c2fb45c1a1d36bb8aa5f466066a5.jpg',
                        //   title: 'Concerts',
                        //   onTap: () {},
                        // ),
                      ],
                    ),
                    SizedBox(height: 10),

                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          eventCard(
                            imagePath:
                                'assets/images/acd5488e27bb1f7e741ed109d8554c5209cf907a.png',
                            title: 'Echoes of Earth, 2025',
                            location: 'Venue to be announced, Bengaluru',
                            date: 'Sat, 13 Dec, 1:00 PM',
                            isSaved: isSaved,
                            onSaveToggle: () {
                              setState(() {
                                isSaved = !isSaved;
                              });
                            },
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EventTypeScreen(),
                                ),
                              );
                            },
                          ),

                          eventCard(
                            imagePath:
                                'assets/images/00616f4e863684eebc1eb43dae2ef8a170cbb5b6.png',
                            title: 'Echoes of Earth, 2025',
                            location: 'Venue to be announced, Bengaluru',
                            date: 'Sat, 13 Dec, 1:00 PM',
                            onTap: () {
                              // handle tap
                            },
                          ),
                          eventCard(
                            imagePath:
                                'assets/images/00616f4e863684eebc1eb43dae2ef8a170cbb5b6.png',
                            title: 'Echoes of Earth, 2025',
                            location: 'Venue to be announced, Bengaluru',
                            date: 'Sat, 13 Dec, 1:00 PM',
                            onTap: () {
                              // handle tap
                            },
                          ),
                          eventCard(
                            imagePath:
                                'assets/images/acd5488e27bb1f7e741ed109d8554c5209cf907a.png',
                            title: 'Echoes of Earth, 2025',
                            location: 'Venue to be announced, Bengaluru',
                            date: 'Sat, 13 Dec, 1:00 PM',
                            onTap: () {
                              // handle tap
                            },
                          ),
                          eventCard(
                            imagePath:
                                'assets/images/acd5488e27bb1f7e741ed109d8554c5209cf907a.png',
                            title: 'Echoes of Earth, 2025',
                            location: 'Venue to be announced, Bengaluru',
                            date: 'Sat, 13 Dec, 1:00 PM',
                            onTap: () {
                              // handle tap
                            },
                          ),
                        ],
                      ),
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

  Widget _buildDiscoverCard({
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: const Color(0XFFF9F9F9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              elevation: 2,
              child: SizedBox(
                height: 70,
                width: double.infinity,
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget eventCard({
    required String imagePath,
    required String title,
    required String date,
    required String location,
    VoidCallback? onTap,
    bool isSaved = false,
    VoidCallback? onSaveToggle,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
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
                            size: 24,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.pink,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
