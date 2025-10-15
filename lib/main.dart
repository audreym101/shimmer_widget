import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shimmer Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ShimmerDemo(),
    );
  }
}

class ShimmerDemo extends StatefulWidget {
  const ShimmerDemo({super.key});

  @override
  State<ShimmerDemo> createState() => _ShimmerDemoState();
}

class _ShimmerDemoState extends State<ShimmerDemo> {
  bool _isLoading = true;

  final List<String> _data = [
    "Alice",
    "Bob",
    "Charlie",
    "Diana",
    "Eve",
    "Frank"
  ];

  @override
  void initState() {
    super.initState();
    // Simulate loading
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fancy Shimmer Demo")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _isLoading ? _buildShimmerList() : _buildDataList(),
      ),
    );
  }

  // Shimmer placeholders
  Widget _buildShimmerList() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                // Circle avatar
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                // Text lines
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 16, color: Colors.white),
                      const SizedBox(height: 8),
                      Container(height: 16, width: 150, color: Colors.white),
                      const SizedBox(height: 8),
                      Container(height: 16, width: 100, color: Colors.white),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // Real data
  Widget _buildDataList() {
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(_data[index][0]),
          ),
          title: Text(_data[index]),
          subtitle: const Text("This is loaded content."),
        );
      },
    );
  }
}
