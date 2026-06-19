import 'package:flutter/material.dart';

class MixLayout extends StatelessWidget {
  const MixLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grid above, List below')),
      body: Column(
        children: [
          // Top: GridView inside a fixed-height container (half of available height)
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.blue[(index % 9 + 1) * 100],
                  child: Center(
                    child: Text(
                      'G${index + 1}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),

          const Divider(height: 1),

          // Bottom: ListView fills remaining space
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: 20,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.grey.shade200,
                  title: Text('Item ${index + 1}'),
                  leading: CircleAvatar(child: Text('${index + 1}')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
