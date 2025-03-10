
import 'package:flutter/material.dart';
import 'profile_page.dart';
import '../widgets/cbutton.dart';

class HomePage extends StatefulWidget {
  final String username;
  final String nickname;

  const HomePage({Key? key, required this.username, required this.nickname}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _nimController = TextEditingController();
  final _workExpController = TextEditingController();
  final _orgExpController = TextEditingController();
  final _hardSkillController = TextEditingController();
  final _softSkillController = TextEditingController();
  final _achievementController = TextEditingController();

  void _submitData() {
    // Validasi form sebelum submit
    if (_formKey.currentState!.validate()) {
      String fullName = _fullNameController.text;
      String nim = _nimController.text;
      String workExp = _workExpController.text;
      String orgExp = _orgExpController.text;
      String hardSkill = _hardSkillController.text;
      String softSkill = _softSkillController.text;
      String achievement = _achievementController.text;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            username: widget.username,
            nickname: widget.nickname,
            fullName: fullName,
            nim: nim,
            workExp: workExp,
            orgExp: orgExp,
            hardSkill: hardSkill,
            softSkill: softSkill,
            achievement: achievement,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String displayName = widget.nickname.isNotEmpty ? widget.nickname : widget.username;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Selamat Datang $displayName", 
        style: TextStyle(
          color: Colors.white,
          )
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 96, 79, 147),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  labelText: "Nama Lengkap",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama Lengkap tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nimController,
                decoration: const InputDecoration(
                  labelText: "NIM",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "NIM tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _workExpController,
                decoration: const InputDecoration(
                  labelText: "Pengalaman Kerja",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Pengalaman Kerja tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _orgExpController,
                decoration: const InputDecoration(
                  labelText: "Pengalaman Organisasi",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Pengalaman Organisasi tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _hardSkillController,
                decoration: const InputDecoration(
                  labelText: "Hard Skill",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Hard Skill tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _softSkillController,
                decoration: const InputDecoration(
                  labelText: "Soft Skill",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Soft Skill tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _achievementController,
                decoration: const InputDecoration(
                  labelText: "Pencapaian/Penghargaan",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Pencapaian/Penghargaan tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              CButton(
                text: "Lihat Profil",
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
