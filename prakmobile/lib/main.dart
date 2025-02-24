import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('Dashboard'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          // Foto Profil
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/image/Logo UPNVY.png'),
          ),
          SizedBox(height: 10),
          // Nama dan NIM
          Text(
            'Chairul Zaman',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text('123220124', style: TextStyle(fontSize: 16, color: Colors.grey)),
          SizedBox(height: 20),
          // Tombol Horizontal
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Tombol 1'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('Tombol 2'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Tombol 3'),
              ),
            ],
          ),
          SizedBox(height: 20),
          GridView.builder(
            padding: EdgeInsets.all(15),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (_, index) {
              final colors = [
                Colors.lightGreen,
                Colors.green,
                Colors.green,
                Colors.lightGreen
              ];
              return Card(
                  color: colors[index],
                  child: Padding(
                    padding: const EdgeInsets.all(70),
                    child: FlutterLogo(),
                  )
              );
            },
            itemCount: 4,
            shrinkWrap: true,
          )
        ],
      ),
    );
  }
}