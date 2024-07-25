import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

  Future<Map<String,dynamic>>fetchData(String url) async{
    final response =await http.post(Uri.parse(url));
    if (response.statusCode == 200){
      return json.decode(response.body);
    }
    else{
      throw Exception("Failed to load data");
    }
  }

class ApiWidget extends StatelessWidget {
  final String url;
  ApiWidget({required this.url});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: fetchData(url),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator());
        }
        else if (snapshot.hasError)
        {
          return Center(
              child: Text('Error: ${snapshot.error}'));
        }
        else if (!snapshot.hasData)
        {
          return Center(child: Text('No data found'));
        }
        else {
          final data = snapshot.data!;
          return ListView(
            children: data.entries.map((entry) {
              return ListTile(
                title: Text(entry.key),
                subtitle: Text(entry.value.toString()),
              );
            }).toList(),
          );
        }
      },
    );
  }
}

 