import 'package:flutter/material.dart';

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
      {"icon": Icons.cut, "label": "Hair", "color": Colors.pinkAccent.shade200},
      {
        "icon": Icons.face,
        "label": "Face",
        "color": Colors.orangeAccent.shade200
      },
      {
        "icon": Icons.medical_services,
        "label": "Dental",
        "color": Colors.blueAccent.shade200
      },
      {
        "icon": Icons.medical_services,
        "label": "Nails",
        "color": Colors.purpleAccent.shade200
      },
      {
        "icon": Icons.spa,
        "label": "Body",
        "color": Colors.greenAccent.shade200
      },
    ],
    "subcategories": ["Haircuts", "Hair Color", "Hair Treatments", "Blow Dry"],
    "services": [
      {
        "title": "Morales Salon",
        "price": "\$12",
        "location": "89 Academy Street",
        "rating": 4.8,
        "image": "assets/images/home_screen_image.png",
        "discount": "Save up to 15%"
      },
      {
        "title": "Luxury Salon",
        "price": "\$20",
        "location": "56 Park Avenue",
        "rating": 4.7,
        "image": "assets/images/home_screen_image.png",
        "discount": "Save up to 10%"
      }
    ]
  };

  int selectedCategoryIndex = 0;
  int selectedSubcategoryIndex = 0;

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
                          icon: const Icon(Icons.notifications_outlined,
                              size: 28),
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
                    child: const Icon(Icons.tune, color: Colors.white),
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
                        });
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: selectedCategoryIndex == -1
                                  ? randomPastelColor.withOpacity(0.1)
                                  : isSelected
                                      ? randomPastelColor
                                      : randomPastelColor.withOpacity(0.1),
                              radius: 30,
                              child: Icon(
                                category['icon'],
                                size: 20,
                                color: selectedCategoryIndex == -1
                                    ? randomPastelColor
                                    : isSelected
                                        ? Colors.white
                                        : randomPastelColor.withOpacity(0.3),
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
                            child: const Text('Services',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              padding: const EdgeInsets.only(left: 20),
                              scrollDirection: Axis.horizontal,
                              itemCount: data['services'].length,
                              itemBuilder: (context, index) {
                                final service = data['services'][index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Stack(
                                      children: [
                                        Image.asset(service['image'],
                                            height: 200,
                                            width: 300,
                                            fit: BoxFit.cover),
                                        Positioned(
                                          top: 10,
                                          left: 10,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              service['discount'],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
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
                                                const Icon(Icons.star,
                                                    color: Colors.yellow,
                                                    size: 16),
                                                Text(
                                                    service['rating']
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white)),
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

              // Section Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Popular Services',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('See All',
                        style: TextStyle(color: Colors.grey[600])),
                  )
                ],
              ),
              const SizedBox(height: 10),

              // Service Cards (Horizontal Scroll)
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data['services'].length,
                  itemBuilder: (context, index) {
                    final service = data['services'][index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            Image.asset(service['image'],
                                height: 200, width: 300, fit: BoxFit.cover),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  service['discount'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
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
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.yellow, size: 16),
                                    Text(service['rating'].toString(),
                                        style: const TextStyle(
                                            color: Colors.white)),
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
              const SizedBox(height: 20),

              // Bottom Navigation Bar
              BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                currentIndex: 0,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.pink,
                unselectedItemColor: Colors.grey,
                onTap: (index) {
                  setState(() {
                    var _selectedTab = index;
                  });
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.calendar_today), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_border), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline), label: ''),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
