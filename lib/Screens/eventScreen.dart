import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketfirst/Screens/comedyShowsScreen.dart';
import 'package:ticketfirst/Screens/eventOnboardingScreen.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class EventScreen extends ConsumerWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Event Screen",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildColumnCard(
                      imagePath:
                          "assets/images/icon-park-solid_entertainment.png",
                      title: "Entertainment",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventOnBoardingScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 20),
                    buildColumnCard(
                      imagePath: "assets/images/Vector copy 2.png",
                      title: "Sports & Fitness",
                      onTap: () {},
                    ),
                    const SizedBox(width: 20),
                    buildColumnCard(
                      imagePath: "assets/images/Vector (1).png",
                      title: "Festivals & Cultural",
                      onTap: () {},
                    ),
                    const SizedBox(width: 20),
                    buildColumnCard(
                      imagePath:
                          "assets/images/streamline-freehand-color_amusement-park-ferris-wheel.png",
                      title: "Amusement & Adventure",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Special Offers",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComedyShowsScreen(),
                      ),
                    );
                  },
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

            SizedBox(height: 12),

            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildImageCard(
                    "assets/images/ec807a2bb0bf5911487a0e6553fdb06dde25803b.png",
                  ),
                  const SizedBox(width: 12),
                  _buildImageCard(
                    "assets/images/ad6a719934384f697121b49bf12b8c249acd8065.png",
                  ),
                  const SizedBox(width: 12),
                  _buildImageCard(
                    "assets/images/ec807a2bb0bf5911487a0e6553fdb06dde25803b.png",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Best Event This Week",
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

            SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildEventCard(
                    "assets/images/acd5488e27bb1f7e741ed109d8554c5209cf907a.png",
                  ),
                  const SizedBox(width: 12),
                  _buildEventCard(
                    "assets/images/00616f4e863684eebc1eb43dae2ef8a170cbb5b6.png",
                  ),
                  const SizedBox(width: 12),
                  _buildEventCard(
                    "assets/images/11f0f75b4d3c66b1ac9179f104ab7384b31efeac.png",
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Event",
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

            SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildPopularEventCard(
                    "assets/images/ee8b86e131b21e6c09a7ac112bec4987f3cbe75b.png",
                  ),
                  const SizedBox(width: 12),
                  _buildPopularEventCard(
                    "assets/images/00246abbbc92d30559c0bcdc2b445d63a064807d.png",
                  ),
                  const SizedBox(width: 12),
                  _buildPopularEventCard(
                    "assets/images/ad6a719934384f697121b49bf12b8c249acd8065.png",
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ultimate Event List",
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
            SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildEventListCard(
                    "assets/images/252356b7bf7b97e9ba7d824454d13ddd3b174736.png",
                  ),
                  const SizedBox(width: 12),
                  _buildEventListCard(
                    "assets/images/18280491a0ec56049d5feee90e4c026921e92a74.png",
                  ),
                  const SizedBox(width: 12),
                  _buildEventListCard(
                    "assets/images/252356b7bf7b97e9ba7d824454d13ddd3b174736.png",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildColumnCard({
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 36,
            height: 36,
            color: Colors.red, // optional red tint
          ),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(imagePath, width: 300, height: 200, fit: BoxFit.cover),
    );
  }

  Widget _buildEventCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(imagePath, width: 100, height: 120, fit: BoxFit.cover),
    );
  }

  Widget _buildPopularEventCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(imagePath, width: 200, height: 200, fit: BoxFit.cover),
    );
  }

  Widget _buildEventListCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(imagePath, width: 300, height: 200, fit: BoxFit.cover),
    );
  }
}
