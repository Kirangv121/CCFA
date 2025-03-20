import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  // Sample list of results (replace with actual data from your backend or local storage)
  List<Map<String, String>> results = [
    {'fileName': 'Fraud_Analysis_01.csv', 'date': '2024-12-01'},
    {'fileName': 'Transaction_Report_02.csv', 'date': '2024-12-10'},
    {'fileName': 'Suspicious_Activity_03.csv', 'date': '2024-12-14'},
  ];

  // Method to delete a result
  void deleteResult(int index) {
    setState(() {
      results.removeAt(index); // Remove the selected result
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results CSV Files'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: results.isNotEmpty
          ? ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.file_present, color: Colors.blueAccent),
                    title: Text(
                      results[index]['fileName']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Date: ${results[index]['date']}"),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Confirm before deleting
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Delete Result"),
                              content: Text(
                                  "Are you sure you want to delete '${results[index]['fileName']}'?"),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text("Delete"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    deleteResult(index); // Delete result
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
                "No results found. Analyze a CSV file to generate results.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
