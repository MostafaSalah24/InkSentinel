import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  Future<void> _deleteEntry(String docId, BuildContext context) async {
    bool confirmDelete = await _showDeleteDialog(context);
    if (confirmDelete) {
      try {
        await FirebaseFirestore.instance
            .collection('Results')
            .doc(docId)
            .delete();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Entry deleted successfully')),
        );
      } catch (e) {
        String errorMessage = 'An error occurred';
        if (e is FirebaseException) {
          errorMessage = e.message ?? 'Unknown Firestore error';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting entry: $errorMessage')),
        );
      }
    }
  }

  Future<bool> _showDeleteDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirm Deletion'),
            content: const Text('Are you sure you want to delete this entry?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child:
                    const Text('Delete', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: const Color(0xff259FA2),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Results')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text('No history available',
                    style: TextStyle(fontSize: 18)));
          }

          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
              final docId = docs[index].id; // Firestore document ID

              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: data['originalImagePath'] != null &&
                          data['originalImagePath'].isNotEmpty
                      ? FadeInImage.assetNetwork(
                          placeholder:
                              'assets/loading.png', // Add a loading image in assets
                          image: data['originalImagePath'],
                          width: 50, height: 50, fit: BoxFit.cover,
                          imageErrorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.image,
                                  size: 50, color: Colors.grey),
                        )
                      : const Icon(Icons.image, size: 50, color: Colors.grey),
                  // leading: data['originalImagePath'] != null
                  //     ? Image.network(data['originalImagePath'],
                  //         width: 50, height: 50, fit: BoxFit.cover)
                  //     : const Icon(Icons.image, size: 50, color: Colors.grey),
                  title: Text(
                    '${data['originalImage'] ?? 'Original'} & ${data['currentImage'] ?? 'Current'}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date: ${data['date'] ?? 'Unknown'}',
                          style: const TextStyle(color: Colors.grey)),
                      Text(
                        'Result: ${data['result'] ?? 'Unknown'}',
                        style: TextStyle(
                          color: (data['result'] ?? '') == 'Fake'
                              ? Colors.red
                              : Colors.green,
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteEntry(docId, context),
                  ),
                  onLongPress: () =>
                      _deleteEntry(docId, context), // Long press to delete
                ),
              );
            },
          );
        },
      ),
    );
  }
}
