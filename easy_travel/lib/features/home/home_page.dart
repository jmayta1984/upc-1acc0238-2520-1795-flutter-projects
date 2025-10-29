import 'package:easy_travel/features/home/destination.dart';
import 'package:easy_travel/features/home/destination_card.dart';
import 'package:easy_travel/features/home/destination_detail_page.dart';
import 'package:easy_travel/features/home/destination_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Destination> _destinations = [];

  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Beach',
    'Adventure',
    'City',
    'Cultural',
  ];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  Future<void> _loadData() async {
    List<Destination> destinations = await DestinationService()
        .getDestinations();
    setState(() {
      _destinations = destinations;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 48,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final String category = _categories[index];
              return FilterChip(
                selected: _selectedCategory == category,
                label: Text(category),
                onSelected: (value) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: _categories.length,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _destinations.length,
            itemBuilder: (context, index) {
              final Destination destination = _destinations[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DestinationDetailPage(destination: destination),
                  ),
                ),
                child: DestinationCard(destination: destination),
              );
            },
          ),
        ),
      ],
    );
  }
}
