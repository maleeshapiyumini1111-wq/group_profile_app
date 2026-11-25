import 'package:flutter/material.dart';

const _name = 'Samudini Premachandra';
const _address = 'Matara, Sri Lanka';
const _email = 'samudini@gmail.com';
const _photoPath = 'assets/images/samudini.jpeg';
const _education = [
  'G.C.E. O/L - 9A',
  'G.C.E. A/L - CCC',
  'Diploma / Certificate - Institute of Technology University of Moratuwa',
];
const _softSkills = ['Teamwork', 'Leadership', 'Adaptability'];
const _talents = ['Cricket', 'VolleyBall', 'Dancing','Elle'];
// ==============================================================

class _CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final p = Path()..lineTo(0, size.height - 50);
    p.quadraticBezierTo(size.width / 2, size.height + 30, size.width, size.height - 50);
    p.lineTo(size.width, 0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class Member8Screen extends StatelessWidget {
  const Member8Screen({super.key});

  Widget _section(String t, Widget c) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(t, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFE53935))),
          const SizedBox(height: 6),
          c,
        ]),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(clipBehavior: Clip.none, alignment: Alignment.bottomCenter, children: [
            ClipPath(
              clipper: _CurveClipper(),
              child: Container(
                height: 240,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFFFF7043), Color(0xFFE53935)]),
                ),
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 40, left: 8),
                child: const BackButton(color: Colors.white),
              ),
            ),
            Positioned(
              bottom: -50,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 5),
                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
                ),
                child: ClipOval(
                  child: Image.asset(_photoPath,
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                          width: 110, height: 110, color: Colors.red.shade100, child: const Icon(Icons.person, size: 60))),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 62),
          const Center(child: Text(_name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
          const Center(child: Text(_address)),
          const Center(child: Text(_email)),
          const SizedBox(height: 16),
          _section('Education', Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [for (final e in _education) Text('• $e')])),
          _section('Soft Skills', Wrap(spacing: 8, children: [for (final s in _softSkills) Chip(label: Text(s))])),
          _section('Special Talents', Wrap(spacing: 8, children: [for (final t in _talents) Chip(label: Text(t))])),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
