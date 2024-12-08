import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyListView(),
    );
  }
}

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final List<Map<String, String>> data = [
    {"name": "John Doe", "contact": "123-456-7890", "image": "https://example.com/image1.jpg"},
    {"name": "Jane Smith", "contact": "234-567-8901", "image": "https://example.com/image2.jpg"},
    {"name": "Sam Green", "contact": "345-678-9012", "image": "https://example.com/image3.jpg"},
    // Add more entries here
  ];

  TextEditingController _searchController = TextEditingController();
  late List<Map<String, String>> _filteredData;

  @override
  void initState() {
    super.initState();
    _filteredData = data;
    _searchController.addListener(_filterData);
  }

  void _filterData() {
    setState(() {
      _filteredData = data
          .where((item) =>
              item["name"]!.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact List")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredData.length,
              itemBuilder: (context, index) {
                final item = _filteredData[index];
                return ListTile(
                  leading: Image.network(item['image']!, width: 50, height: 50),
                  title: Text(item['name']!),
                  subtitle: Text(item['contact']!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
