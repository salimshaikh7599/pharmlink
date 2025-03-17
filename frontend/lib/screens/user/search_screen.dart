import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> pastSearches = [];
  List<String> popularSearches = ['Ibuprofen', 'Paracetamol'];
  List<String> frequentlyBought = ['Vitamin C', 'Cough Syrup'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for medicine or products',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      pastSearches.clear();
                    });
                  },
                ),
              ),
              onSubmitted: (value) {
                setState(() {
                  pastSearches.add(value);
                });
              },
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Past Searches',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Wrap(
              spacing: 8,
              children: pastSearches.map((s) => Chip(label: Text(s))).toList(),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Popular Searches',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Wrap(
              spacing: 8,
              children:
                  popularSearches.map((s) => Chip(label: Text(s))).toList(),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Frequently Bought',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Wrap(
              spacing: 8,
              children:
                  frequentlyBought.map((s) => Chip(label: Text(s))).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
