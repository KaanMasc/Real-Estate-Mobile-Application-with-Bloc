import 'package:flutter/material.dart';

abstract class BaseListScreen extends StatefulWidget {
  @override
  _BaseListScreenState createState() => _BaseListScreenState();

  Future<List<Map<String, dynamic>>> fetchData();
  Widget buildListItem(BuildContext context, Map<String, dynamic> item);
  Widget buildLoadingIndicator();
  Widget buildErrorWidget(dynamic error);
  Widget buildEmptyListWidget();
  Widget buildDetailScreen(Map<String, dynamic> item);
}

class _BaseListScreenState extends State<BaseListScreen> {
  late Future<List<Map<String, dynamic>>> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = widget.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return widget.buildLoadingIndicator();
          } else if (snapshot.hasError) {
            return widget.buildErrorWidget(snapshot.error);
          } else {
            List<Map<String, dynamic>> items = snapshot.data!;
            if (items.isEmpty) {
              return widget.buildEmptyListWidget();
            } else {
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index]['title']),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              widget.buildDetailScreen(items[index]),
                        ),
                      );
                    },
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
