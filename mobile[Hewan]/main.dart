import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'description_page.dart'; // Import the description page
import 'add_page.dart'; // Import the add page
import 'search_product_page.dart'; // Import the search product page

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(254, 254, 254, 1), // Set the background color
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(254, 254, 254, 1), // Set the background color
        leading: const Icon(
          Icons.square_rounded,
          size: 50,
          color: Color.fromARGB(255, 184, 182, 182),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'July 14, 2023',
              style: TextStyle(
                fontFamily: 'Syne',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 14.4 / 12,
                color: Color.fromARGB(255, 170, 170, 170),
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Hello, ',
                style: const TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  height: 18.9 / 15,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Yohannes',
                    style: const TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      height: 18.9 / 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: const Color.fromRGBO(221, 221, 221, 1)),
            ),
            child: IconButton(
              icon: const Icon(Icons.notifications_outlined),
              color: Colors.black.withOpacity(0.7),
              iconSize: 20,
              onPressed: () {
                print('Notification icon tapped!');
                // Implement your notification functionality here
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProductPage(),
            ),
          );
        },
        backgroundColor: Color.fromRGBO(63, 81, 243, 1),

        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Available Products',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    height: 36 / 24, // Line height divided by font size
                    color: Color.fromRGBO(62, 62, 62, 1),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: const Color.fromRGBO(221, 221, 221, 1)),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.black.withOpacity(0.3),
                    iconSize: 20,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchProductPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DescriptionPage(),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        color: Colors.white,
                        elevation: 4, // Adjust shadow here
                        shadowColor: const Color.fromRGBO(0, 0, 0, 0.1), // Adjust shadow color here
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                              child: Image.asset(
                                'Image/image.png',
                                width: double.infinity,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Derby Leather Shoes',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      height: 30 / 20, // Line height divided by font size
                                      color: Color.fromRGBO(62, 62, 62, 1),
                                    ),
                                  ),
                                  Text(
                                    '\$120',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 21 / 14, // Line height divided by font size
                                      color: Color.fromRGBO(62, 62, 62, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Men's Shoe",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      height: 18 / 12,
                                      color: Color.fromARGB(255, 170, 170, 170),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Icon(Icons.star, color: Colors.amber, size: 20),
                                      ),
                                      SizedBox(
                                        width: 29,
                                        height: 15,
                                        child: Text(
                                          '(4.0)',
                                          style: TextStyle(
                                            fontFamily: 'Sora',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            height: 15.12 / 12,
                                            color: Color.fromARGB(255, 187, 184, 184),
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
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
