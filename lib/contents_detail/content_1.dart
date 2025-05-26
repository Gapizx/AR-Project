import 'package:flutter/material.dart';
import 'package:AR_Project/screen/ar_screen.dart';

class Content1 extends StatelessWidget {
  const Content1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Exercises', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/dumbbell.jpg', fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            const Text('Dumbbell Curl', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Row(
              children: const [
                Icon(Icons.push_pin, size: 16, color: Colors.blue),
                SizedBox(width: 6),
                Text('Biceps', style: TextStyle(color: Colors.grey)),
              ],
            ),
            const Divider(height: 24),
            const Text('Instructions:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text('1. Stand with feet shoulder-width apart, holding dumbbells at your sides'),
            const Text('2. Keep elbows close to your torso and palms facing forward'),
            const Text('3. Curl the weights toward your shoulders while contracting your biceps'),
            const Text('4. Lower the weights back to starting position with control'),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _InfoColumn(label: 'Sets', value: '3-4'),
                _InfoColumn(label: 'Reps', value: '10-12'),
                _InfoColumn(label: 'Rest', value: '60 sec'),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ARScreen()));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Active AR Here', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String label;
  final String value;

  const _InfoColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(value),
      ],
    );
  }
}
