import 'package:flutter/material.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  int? _selectedSize;
  String? _selectedAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(254, 254, 254, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.0)),
                  ),
                  margin: EdgeInsets.zero,
                  color: const Color.fromRGBO(254, 254, 254, 1),
                  elevation: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                          color: Colors.black,
                        ),
                        child: Image.asset(
                          'Image/imagecopy.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Men's Shoe",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 187, 184, 184),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber, size: 16),
                                    Text(
                                      '(4.0)',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 187, 184, 184),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Derby Leather Shoes',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '\$120',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
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
                Positioned(
                  top: 16,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    radius: 20,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Color.fromRGBO(63, 81, 243, 1), size: 24),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 16,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            buildSizeSection(),
            const SizedBox(height: 20),
            buildDescriptionText(),
            const SizedBox(height: 30),
            buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildSizeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Size:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(50, (index) {
                final size = 39 + index;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.03),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: ChoiceChip(
                      label: Text(
                        size.toString(),
                        style: TextStyle(
                          color: _selectedSize == size ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      selected: _selectedSize == size,
                      selectedColor: const Color.fromRGBO(63, 81, 243, 1),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: BorderSide.none,
                      onSelected: (selected) {
                        setState(() {
                          _selectedSize = selected ? size : null;
                        });
                      },
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDescriptionText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
          height: 1.5,
        ),
      ),
    );
  }

  Widget buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: _selectedAction == 'delete' ? const Color.fromRGBO(63, 81, 243, 1) : Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: _selectedAction == 'delete' ? Colors.transparent : Colors.red,
                  width: 1,
                ),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _selectedAction = 'delete';
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  'Delete',
                  style: TextStyle(
                    color: _selectedAction == 'delete' ? Colors.white : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: _selectedAction == 'update' ? const Color.fromRGBO(63, 81, 243, 1) : Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: _selectedAction == 'update' ? Colors.transparent : Colors.red,
                  width: 1,
                ),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _selectedAction = 'update';
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  'Update',
                  style: TextStyle(
                    color: _selectedAction == 'update' ? Colors.white : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
