import 'package:flutter/material.dart';


class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final List<Map<String, String>> data = [
    {"name": "John Doe", "contact": "123-456-7890" },
    {"name": "Jane Smith", "contact": "234-567-8901" },
    {"name": "Sam Green", "contact": "345-678-9012"},
    {"name": "John Doe", "contact": "123-456-7890"},
    {"name": "Jane Smith", "contact": "234-567-8901"},
    {"name": "Sam Green", "contact": "345-678-9012"},
    {"name": "Alice Brown", "contact": "456-789-0123"},
    {"name": "Bob White", "contact": "567-890-1234"},
    {"name": "Charlie Black", "contact": "678-901-2345"},
    {"name": "David Blue", "contact": "789-012-3456"},
    {"name": "Eva Yellow", "contact": "890-123-4567"},
    {"name": "Frank Gray", "contact": "901-234-5678"},
    {"name": "Grace Pink", "contact": "012-345-6789"},
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
      appBar: AppBar(centerTitle: true,title: Text("Contact Nearby Doctros")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color.fromRGBO(244, 243, 243, 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.black87),
                  border: InputBorder.none,
                  hintText: "Search for what you're looking for",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredData.length,
              itemBuilder: (context, index) {
                final item = _filteredData[index];
                return ListTile(
                  minLeadingWidth: 50,
                  minTileHeight: 50,
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
