import 'package:flutter/material.dart';


const _name = 'Hashini Nisansala';
const _address = 'Kandy, Sri Lanka';
const _email = 'nisansala@gmail.com';
const _photoPath = 'assets/images/nisansala.jpeg';
const _education = [
  'G.C.E. O/L - 8A 1B',
  'G.C.E. A/L - CCC',
  'Diploma / Certificate - Institute of Technology University of Moratuwa',
];
const _softSkills = ['Teamwork',  'Time management'];
const _talents = ['Volleyball', 'Dancing', 'Drawing'];
// ==============================================================

class Member2Screen extends StatelessWidget {
  const Member2Screen({super.key});

  Widget _list(List<String> items, IconData icon) => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final i in items)
            Card(child: ListTile(leading: Icon(icon, color: Colors.teal), title: Text(i))),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          title: const Text(_name),
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [Tab(text: 'About'), Tab(text: 'Education'), Tab(text: 'Skills'), Tab(text: 'Talents')],
          ),
        ),
        body: TabBarView(children: [
          Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(_photoPath,
                    width: 180,
                    height: 220,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                        width: 180, height: 220, color: Colors.teal.shade100, child: const Icon(Icons.person, size: 80))),
              ),
              const SizedBox(height: 16),
              const Text(_name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text(_address),
              const Text(_email),
            ]),
          ),
          _list(_education, Icons.school),
          _list(_softSkills, Icons.psychology),
          _list(_talents, Icons.star),
        ]),
      ),
    );
  }
}
