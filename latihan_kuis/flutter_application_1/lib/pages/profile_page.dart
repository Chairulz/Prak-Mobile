
import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final String nickname;
  final String fullName;
  final String nim;
  final String workExp;
  final String orgExp;
  final String hardSkill;
  final String softSkill;
  final String achievement;

  const ProfilePage({
    Key? key,
    required this.username,
    required this.nickname,
    required this.fullName,
    required this.nim,
    required this.workExp,
    required this.orgExp,
    required this.hardSkill,
    required this.softSkill,
    required this.achievement,
  }) : super(key: key);

  TableRow buildRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(value),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page", 
        style: TextStyle(
          color: Colors.white,
        )
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 96, 79, 147),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/image/profile.jpg'),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                
                child: Table(
                  columnWidths: const {
                    0: FixedColumnWidth(150), // Lebar kolom label
                    1: FlexColumnWidth(),
                  },
                  children: [
                    buildRow("Nama Lengkap", fullName),
                    buildRow("NIM", nim),
                    buildRow("Pengalaman Kerja", workExp),
                    buildRow("Pengalaman Organisasi", orgExp),
                    buildRow("Hard Skill", hardSkill),
                    buildRow("Soft Skill", softSkill),
                    buildRow("Pencapaian", achievement),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 96, 79, 147),
                ),
                onPressed: () {
                  // Tombol logout: kembali ke Login Page dan hilangkan riwayat navigasi
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false,
                  );
                },
                child: const Text("Logout", 
                 style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
