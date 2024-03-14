import 'package:flutter/material.dart';

class CountrySelectionScreen extends StatefulWidget {
  final String selectedCountry;

  const CountrySelectionScreen({super.key, required this.selectedCountry});

  @override
  State<CountrySelectionScreen> createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  late int selectedIndex = 0;

  final List<Map<String, String>> countries = [
    {
      'name': 'India',
      'imagePath': 'assets/india.png',
    },
    {
      'name': 'United States',
      'imagePath': 'assets/us.png',
    },
    {
      'name': 'Mauritius',
      'imagePath': 'assets/mauritius.png',
    },
    {
      'name': 'Romania',
      'imagePath': 'assets/romania.png',
    },
    {
      'name': 'South Africa',
      'imagePath': 'assets/southafrica.png',
    },
    {
      'name': 'Yemen',
      'imagePath': 'assets/yemen.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = countries
        .indexWhere((element) => element['name'] == widget.selectedCountry);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Country'),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: countries.length,
        itemBuilder: (context, index) {
          String countryName = countries[index]['name']!;
          String imagePath = countries[index]['imagePath']!;
          return ListTile(
            leading: Image.asset(imagePath),
            title: Text(countryName),
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              Navigator.pop(context, [
                imagePath,
                countryName,
                selectedIndex != -1,
              ]);
            },
            trailing: CircleSelection(
              selected: selectedIndex == index,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class CircleSelection extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;

  const CircleSelection(
      {super.key, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white),
          color: selected ? Colors.white : Colors.transparent,
        ),
      ),
    );
  }
}
