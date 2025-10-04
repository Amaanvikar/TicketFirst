import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketfirst/Api/Helper/constant.dart';
import 'package:ticketfirst/Screens/Event/eventConfirmationScreen.dart';

class KnowMoreInfoScreen extends StatefulWidget {
  final String imageUrl;
  final String title;

  final String? text;
  final int? maxLines;
  const KnowMoreInfoScreen({
    super.key,
    required this.imageUrl,
    required this.title,
    this.text,
    this.maxLines = 2,
  });

  @override
  State<KnowMoreInfoScreen> createState() => _KnowMoreInfoScreenState();
}

class _KnowMoreInfoScreenState extends State<KnowMoreInfoScreen> {
  int count = 1;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                        bottom: Radius.circular(8),
                      ),
                      child: Image.asset(
                        widget.imageUrl,
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16),
                    infoRow(
                      icon: Icons.calendar_today,
                      text: 'Thu 2 Oct 2025 - Sun 26 Oct 2025',
                    ),
                    infoRow(icon: Icons.access_time, text: '2:00 PM'),
                    infoRow(icon: Icons.hourglass_bottom, text: '2 Hours'),
                    infoRow(icon: Icons.people, text: 'Age Limit - 16yrs +'),
                    infoRow(icon: Icons.language, text: 'Hindi'),
                    infoRow(icon: Icons.theater_comedy, text: 'Comedy'),
                    infoRow(
                      icon: Icons.location_on,
                      text: 'Deep Smriti (Tagore Auditorium): Nashik',
                    ),
                    SizedBox(height: 10),
                    Text(
                      "About The Event",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.text ??
                          "Get ready to laugh out loud as bassi takes the stage for an evening of rib-tickling comedy! From witty observations about everyday life to hilarious anecdotes and unexpected twists, this show promises non-stop laughter and unforgettable moments. Perfect for friends, families, and anyone in need of a good dose of humor. Come and experience the magic of live stand-up comedy—because laughter is the best therapy!",
                      maxLines: isExpanded ? null : widget.maxLines,
                      overflow:
                          isExpanded
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        isExpanded ? "Read Less" : "Read More",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Additional content here
                  ],
                ),
              ),
            ),
          ),
          // Pay Button at the bottom
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (count > 1) setState(() => count--);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.remove,
                                color: kPrimaryColor,
                                size: 24,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 32,
                            child: Center(
                              child: Text(
                                count.toString().padLeft(2, '0'),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() => count++);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.add,
                                color: kPrimaryColor,
                                size: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  // Pay Button
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => EventConfirmationScreen(
                                    title:
                                        "Kisi Ko Batana Mat Ft. Anubhav Singh Bassi",
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
                          'Pay ₹799',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget infoRow({
    required IconData icon,
    required String text,
    Color iconColor = Colors.black54,
    Color textColor = Colors.black87,
    double iconSize = 20,
    double fontSize = 15,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: iconSize),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: fontSize),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
