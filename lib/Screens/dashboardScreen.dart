import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketfirst/Screens/eventScreen.dart';
import 'package:ticketfirst/Screens/flightScreen.dart';

/// Providers
final currentSlideProvider = StateProvider<int>((ref) => 0);
final selectedButtonProvider = StateProvider<String>((ref) => "");

/// Dashboard Screen
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEEEE),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Flight Booking Application",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // /// Header Section
            // Container(
            //   width: double.infinity,
            //   padding: const EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [Colors.grey.shade700, Colors.grey.shade900],
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //     ),
            //     borderRadius: const BorderRadius.vertical(
            //       bottom: Radius.circular(30),
            //     ),
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: const [
            //       Text(
            //         "Current Status",
            //         style: TextStyle(color: Colors.white70, fontSize: 14),
            //       ),
            //       SizedBox(height: 6),
            //       Row(
            //         children: [
            //           Icon(Icons.radio_button_checked, color: Colors.green),
            //           SizedBox(width: 6),
            //           Text(
            //             "Pending",
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 18,
            //               fontWeight: FontWeight.w600,
            //             ),
            //           ),
            //         ],
            //       ),
            //       SizedBox(height: 16),
            //       Text(
            //         "Choose your Flight",
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 20),
            Text(
              "Special Offers",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFE8C7),
                    foregroundColor: const Color(0xFFFF6452),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: const Color(0xFFFF6452),
                        width: 1,
                      ),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FlightScreen()),
                    );
                  },
                  child: const Text("Flights", style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFE8C7),
                    foregroundColor: const Color(0xFFFF6452),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: const Color(0xFFFF6452),
                        width: 1,
                      ),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {},
                  child: const Text("Trains", style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFE8C7),
                    foregroundColor: const Color(0xFFFF6452),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: const Color(0xFFFF6452),
                        width: 1,
                      ),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {},
                  child: const Text("Buses", style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFE8C7),
                    foregroundColor: const Color(0xFFFF6452),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: const Color(0xFFFF6452),
                        width: 1,
                      ),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventScreen()),
                    );
                  },
                  child: const Text("Events", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),

            SizedBox(height: 10),

            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildImageCard("assets/images/Frame 21.png"),
                  const SizedBox(width: 12),
                  _buildImageCard(
                    "assets/images/c65402acace90b91a87575ad045f9f19114dcfbd.jpg",
                  ),
                  const SizedBox(width: 12),
                  _buildImageCard(
                    "assets/images/cd53a183aa3497b5358fa1ebc84f66a76608b430.jpg",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildCard(
                  title: "Flight",
                  icon: Icons.airplanemode_on_rounded,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FlightScreen()),
                    );
                  },
                ),
                _buildCard(
                  title: "Metro",
                  icon: Icons.train_outlined,
                  onTap: () {},
                ),
                _buildCard(
                  title: "Bus",
                  icon: Icons.bus_alert_outlined,
                  onTap: () {},
                ),
                _buildCard(
                  title: "Event",
                  icon: Icons.event_available_outlined,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventScreen()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featural Event",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.deepOrangeAccent[700],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // ClipRRect(
            //   borderRadius: BorderRadius.circular(15),
            //   child: Stack(
            //     children: [
            //       Image.asset(
            //         "assets/images/Frame 29.png",
            //         width: double.infinity,
            //         height: 200,
            //         fit: BoxFit.cover,
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildImageCard(
                    "assets/images/3e18d8bae2217ead9aa55046868a246c3afec96d.png",
                  ),
                  const SizedBox(width: 12),
                  _buildImageCard(
                    "assets/images/abcd3cfb2f212d8d5ea251a5cb42e64916de8bc1.png",
                  ),
                  const SizedBox(width: 12),
                  _buildImageCard(
                    "assets/images/3e18d8bae2217ead9aa55046868a246c3afec96d.png",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Text(
              "Discover more than travel",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDiscoverCard(
                  imagePath: 'assets/images/Vector.png',
                  title: 'Refer & Earn',
                  onTap: () {},
                ),
                _buildDiscoverCard(
                  imagePath: 'assets/images/Vector copy.png',
                  title: 'PNR Status',
                  onTap: () {},
                ),
                _buildDiscoverCard(
                  imagePath: 'assets/images/Group.png',
                  title: 'Flight Status',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Blogs",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.deepOrangeAccent[700],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildImageCard(
                    "assets/images/85ceaacddfcf140328ee0c883b73174817e4ded1.png",
                  ),
                  const SizedBox(width: 12),
                  _buildImageCard(
                    "assets/images/284c51fca68b2db0bd776886982a4cabe79c8b4c.png",
                  ),
                  const SizedBox(width: 12),
                  _buildImageCard(
                    "assets/images/85ceaacddfcf140328ee0c883b73174817e4ded1.png",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable Stat Card
  Widget _buildCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0XFFF9F9F9),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.deepOrangeAccent[700]),
            const SizedBox(height: 8),

            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(imagePath, width: 300, height: 200, fit: BoxFit.cover),
    );
  }

  void handleButtonClick({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildDiscoverCard({
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: const Color(0XFFF9F9F9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(imagePath, height: 40, color: Colors.red),
                const SizedBox(height: 8),
                Text(title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
