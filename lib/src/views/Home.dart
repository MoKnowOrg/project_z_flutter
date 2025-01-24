import 'package:flutter/material.dart';
import '../components/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// Sample Data
  final Map<String, dynamic> data = {
    "location": "81 School Lane",
    "city": "London, United Kingdom",
    "categories": [
      {
        "icon": "assets/icons/categories/hair.png",
        "label": "Hair",
        "color": Colors.pinkAccent.shade200,
        "subcategories": [
          "Haircuts",
          "Hair Color",
          "Hair Treatments",
          "Blow Dry"
        ]
      },
      {
        "icon": "assets/icons/categories/face.png",
        "label": "Face",
        "color": Colors.orangeAccent.shade200,
        "subcategories": [
          "Facials",
          "Waxing",
          "Microblading",
          "Eyelash Extensions"
        ]
      },
      {
        "icon": "assets/icons/categories/dental.png",
        "label": "Dental",
        "color": Colors.blueAccent.shade200,
        "subcategories": [
          "Teeth Whitening",
          "Dental Cleaning",
          "Dental Implants",
          "Braces"
        ]
      },
      {
        "icon": "assets/icons/categories/nails.png",
        "label": "Nails",
        "color": Colors.purpleAccent.shade200,
        "subcategories": ["Manicure", "Pedicure", "Nail Art", "Nail Extensions"]
      },
      {
        "icon": "assets/icons/categories/body.png",
        "label": "Body",
        "color": Colors.greenAccent.shade200,
        "subcategories": [
          "Massage",
          "Body Scrub",
          "Body Wrap",
          "Body Contouring"
        ]
      }
    ],
    "subcategories": ["Haircuts", "Hair Color", "Hair Treatments", "Blow Dry"],
    "services": [
      {
        "title": "Morales Salon",
        "price": "\$12",
        "location": "89 Academy Street",
        "rating": 4.8,
        "image": "assets/icons/services/salon.jpg",
        "discount": "Save up to 15%",
        "subcategories": ["Hair Treatments", "Blow Dry"]
      },
      {
        "title": "Luxury Salon",
        "price": "\$20",
        "location": "56 Park Avenue",
        "rating": 4.7,
        "image": "assets/icons/services/body.jpg",
        "discount": "Save up to 10%",
        "subcategories": ["Microblading", "Body Contouring"]
      },
      {
        "title": "Elite Hair Studio",
        "price": "\$18",
        "location": "23 High Street",
        "rating": 4.9,
        "image": "assets/icons/services/hair.jpg",
        "discount": "Save up to 20%",
        "subcategories": ["Haircuts", "Hair Color"]
      },
      {
        "title": "Glow Spa",
        "price": "\$25",
        "location": "12 Market Road",
        "rating": 4.6,
        "image": "assets/icons/services/face.jpg",
        "discount": "Save up to 15%",
        "subcategories": ["Facials", "Waxing"]
      },
      {
        "title": "Polished Nails",
        "price": "\$15",
        "location": "34 Elm Street",
        "rating": 4.8,
        "image": "assets/icons/services/nails.jpg",
        "discount": "Save up to 10%",
        "subcategories": ["Manicure", "Nail Art"]
      },
      {
        "title": "Relax & Renew",
        "price": "\$30",
        "location": "78 King Street",
        "rating": 4.7,
        "image": "assets/icons/services/body.jpg",
        "discount": "Save up to 20%",
        "subcategories": ["Massage", "Body Scrub"]
      },
      {
        "title": "Pearl Dental Clinic",
        "price": "\$50",
        "location": "45 Queen Avenue",
        "rating": 4.9,
        "image": "assets/icons/services/dental.jpg",
        "discount": "Save up to 25%",
        "subcategories": ["Teeth Whitening", "Dental Cleaning"]
      },
      {
        "title": "Heavenly Touch",
        "price": "\$35",
        "location": "99 Sunset Boulevard",
        "rating": 4.8,
        "image": "assets/icons/services/body.jpg",
        "discount": "Save up to 15%",
        "subcategories": ["Body Wrap", "Body Contouring"]
      },
      {
        "title": "Chic Beauty Bar",
        "price": "\$22",
        "location": "67 Maple Lane",
        "rating": 4.7,
        "image": "assets/icons/services/face.jpg",
        "discount": "Save up to 10%",
        "subcategories": ["Eyelash Extensions", "Microblading"]
      },
      {
        "title": "Pure Bliss",
        "price": "\$28",
        "location": "88 Cedar Road",
        "rating": 4.8,
        "image": "assets/icons/services/face.jpg",
        "discount": "Save up to 20%",
        "subcategories": ["Facials", "Body Scrub"]
      },
      {
        "title": "Urban Glow",
        "price": "\$40",
        "location": "11 Greenway Avenue",
        "rating": 4.9,
        "image": "assets/icons/services/hair_2.jpg",
        "discount": "Save up to 30%",
        "subcategories": ["Hair Treatments", "Nail Extensions"]
      },
      {
        "title": "Radiant Smile",
        "price": "\$60",
        "location": "50 Tower Bridge Road",
        "rating": 4.8,
        "image": "assets/icons/services/dental.jpg",
        "discount": "Save up to 15%",
        "subcategories": ["Dental Implants", "Braces"]
      },
      {
        "title": "Style & Shine",
        "price": "\$25",
        "location": "31 Rosewood Avenue",
        "rating": 4.6,
        "image": "assets/icons/services/salon.jpg",
        "discount": "Save up to 15%",
        "subcategories": ["Haircuts", "Blow Dry"]
      },
      {
        "title": "Luxe Nails Boutique",
        "price": "\$20",
        "location": "29 Orchid Lane",
        "rating": 4.7,
        "image": "assets/icons/services/nails.jpg",
        "discount": "Save up to 10%",
        "subcategories": ["Pedicure", "Nail Art"]
      },
      {
        "title": "Tranquil Spa",
        "price": "\$35",
        "location": "14 Serenity Drive",
        "rating": 4.8,
        "image": "assets/icons/services/body.jpg",
        "discount": "Save up to 20%",
        "subcategories": ["Massage", "Body Wrap"]
      }
    ]
  };

  int selectedCategoryIndex = 0;
  String selectedCategory = '';
  int selectedSubcategoryIndex = 0;
  String selectedSubcategory = '';
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location and Notification
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              data['location'],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              size: 20,
                            ),
                          ],
                        ),
                        Text(
                          data['city'],
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Stack(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/system/notification-2.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),

              // Search Bar and Filter
              Row(
                children: [
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search services, salons...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      'assets/icons/system/settings.png',
                      color: Colors.white,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 30),

              // Categories
              SizedBox(
                height: 90,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: data['categories'].length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 20),
                  itemBuilder: (context, index) {
                    final category = data['categories'][index];
                    bool isSelected = selectedCategoryIndex == index &&
                        selectedCategoryIndex != -1;
                    Color randomPastelColor =
                        data['categories'][index]['color'];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = isSelected ? -1 : index;

                          // Update subcategories based on the selected category
                          if (selectedCategoryIndex != -1) {
                            data['subcategories'] = category['subcategories'];
                            selectedCategory = category['label'];
                            selectedSubcategoryIndex = 0;
                            selectedSubcategory =
                                data['subcategories'][selectedSubcategoryIndex];
                          } else {
                            data['subcategories'] = [];
                            selectedCategory = '';
                          }
                        });
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: selectedCategoryIndex == -1
                                  ? randomPastelColor.withOpacity(0.2)
                                  : isSelected
                                      ? randomPastelColor
                                      : randomPastelColor.withOpacity(0.2),
                              radius: 30,
                              child: Image.asset(
                                category['icon'],
                                width: 24,
                                height: 24,
                                color: selectedCategoryIndex == -1
                                    ? randomPastelColor
                                    : isSelected
                                        ? Colors.white
                                        : randomPastelColor.withOpacity(0.4),
                              )),
                          const SizedBox(height: 10),
                          Text(
                            category['label'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Subcategories
              if (selectedCategoryIndex != -1)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                        List.generate(data['subcategories'].length, (index) {
                      bool isSelected = selectedSubcategoryIndex == index;
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSubcategoryIndex = index;
                              selectedSubcategory = data['subcategories']
                                  [selectedSubcategoryIndex];
                            });
                          },
                          child: Chip(
                            label: Text(data['subcategories'][index]),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                  color: isSelected
                                      ? Colors.pink
                                      : Colors.transparent),
                            ),
                            backgroundColor:
                                isSelected ? Colors.pink : Colors.transparent,
                            labelStyle: TextStyle(
                                color:
                                    isSelected ? Colors.white : Colors.black),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              const SizedBox(height: 20),

              // Animated Services List
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: selectedCategoryIndex != -1
                    ? Column(
                        key: ValueKey<int>(selectedCategoryIndex),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: const Text(
                              'Services',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              padding: const EdgeInsets.only(left: 20),
                              scrollDirection: Axis.horizontal,
                              itemCount: data['services']
                                  .where((service) {
                                    // Ensure the 'subcategories' key exists and is a list
                                    return service['subcategories'] is List &&
                                        service['subcategories']
                                            .contains(selectedSubcategory);
                                  })
                                  .toList()
                                  .length,
                              itemBuilder: (context, index) {
                                final filteredServices =
                                    data['services'].where((service) {
                                  // Ensure that 'subcategories' exists and is a List
                                  return service['subcategories'] is List &&
                                      service['subcategories']
                                          .contains(selectedSubcategory);
                                }).toList();
                                final service = filteredServices[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          service['image'],
                                          height: 200,
                                          width: 300,
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned(
                                          top: 10,
                                          left: 10,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: Colors.white70,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              service['discount'],
                                              style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          right: 10,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: Colors.black54,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 16,
                                                ),
                                                Text(
                                                  service['rating'].toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 1,
                                          child: Container(
                                            width:
                                                300, // Full width of the image
                                            color: Colors.white,
                                            padding: const EdgeInsets.all(8),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    // Service name
                                                    Text(
                                                      service['title'],
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    // Service price
                                                    Text(
                                                      'From ${service['price']}',
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.location_on,
                                                          size: 16,
                                                          color: Colors.grey,
                                                        ),
                                                        const SizedBox(
                                                            width: 4),
                                                        Text(
                                                          service['location'],
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      'Reviews (12)',
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey,
                                                      ),
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
                              },
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
