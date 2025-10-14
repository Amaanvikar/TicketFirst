import 'package:flutter/material.dart';
import 'package:ticketfirst/Api/Helper/fetchData.dart';

class SeeAllEventListScreen extends StatefulWidget {
  const SeeAllEventListScreen({super.key});

  @override
  State<SeeAllEventListScreen> createState() => SeeAllEventListScreenState();
}

class SeeAllEventListScreenState extends State<SeeAllEventListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "List of Events",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 2,
      ),
        // body: Center(
        // child: GestureDetector(onTap: () {
        //   fetchUser().fetchUserData();
        //   },
        //   child: Text("FetchUser Data"),),),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// SECTION 1: Special Offers
            buildSectionHeader(context, title: "Entertainment"),
            buildEventGrid([
              buildImageCard(
                imagePath:
                    'assets/images/4e9fb3293f3af2e8f28462df14c453156ab3fee4.jpg',
                title: 'Stand-ups',
                onTap: () {},
              ),
              buildImageCard(
                imagePath:
                    'assets/images/4ac18002138c7c72e0ac255e11cd5b49109cc9e1.jpg',
                title: 'Theatre',
                onTap: () {},
              ),
              buildImageCard(
                imagePath:
                    'assets/images/b43ee5c55e41fe9f7e35b95b7ad926a02c3a03e6.jpg',
                title: 'Music Festivals',
                onTap: () {},
              ),
              buildImageCard(
                imagePath:
                    'assets/images/7987c937bda24ec750a2e06043e757f855225d10.jpg',
                title: 'Circus',
                onTap: () {},
              ),
              buildImageCard(
                imagePath:
                    'assets/images/acd5488e27bb1f7e741ed109d8554c5209cf907a.png',
                title: 'Wedding',
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 16),

            /// SECTION 2: Sports & Fitness
            buildSectionHeader(context, title: "Sports & Fitness"),
            buildEventGrid([
              buildImageCard(
                imagePath:
                    'assets/images/6f5ca885494f5a045dc74ee041ec6a7a09de9551.png',
                title: 'Gym',
                onTap: () {},
              ),
              buildImageCard(
                imagePath:
                    'assets/images/d86727c604d6560c48451d40a0ca2a960f8059b3.jpg',
                title: 'Yoga',
                onTap: () {},
              ),
              buildImageCard(
                imagePath: 'assets/images/86a443f4007cfc227e7007b9113c5e8e9842b4a2.jpg',
                title: 'Hobby Classes',
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 16),

            /// SECTION 3: Festivals & Culture
            buildSectionHeader(context, title: "Festivals & Culture"),
            buildEventGrid([
              buildImageCard(
                imagePath: 'assets/images/ccf2d50c21beb8fd584961ce77aed4ee1d8f6e57.png',
                title: 'Wedding',
                onTap: () {},
              ),

              buildImageCard(
                imagePath: 'assets/images/ccf2d50c21beb8fd584961ce77aed4ee1d8f6e57.png',
                title: 'Diwali',
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 16),
            buildSectionHeader(context, title: "Instrument & Adventure"),
            buildEventGrid([
              buildImageCard(
                imagePath: 'assets/images/fee3d57b3bdac3b6cf209d31108fb42c32ebefac.jpg',
                title: 'Water Park',
                onTap: () {},
              ),
              buildImageCard(
                imagePath: 'assets/images/5aa21cb36473f86e9ff10c8fce7a8046a4c352d3.jpg',
                title: 'Theme Park',
                onTap: () {},
              ),
              buildImageCard(
                imagePath: 'assets/images/f7fffe710083b4d26d2ae378404c10b47142020f.jpg',
                title: 'Adventure Park',
                onTap: () {},
              ),
            ]),
          ],
        ),
      ),
     );
  }

  Widget buildSectionHeader(BuildContext context, {required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildEventGrid(List<Widget> cards) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: cards,
      ),
    );
  }

  Widget buildImageCard({
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset(imagePath, fit: BoxFit.cover)),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black87, Colors.transparent],
                  ),
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
