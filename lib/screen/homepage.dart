import 'package:flutter/material.dart';
import 'package:AR_Project/contents_detail/content_1.dart';
// import 'package:AR_Project/contents_detail/content_2.dart';
// import 'package:AR_Project/contents_detail/content_3.dart';
// import 'package:AR_Project/contents_detail/content_4.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Workout Exercises',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 30),
            onPressed: () {
              // ไปหน้า Profile
            },
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: Colors.blue.shade700,
            child: const Center(
              child: Text(
                'Select an exercise to view details',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.53,
              children: [
                _exerciseCard(
                  context: context,
                  title: 'Dumbbell Curl',
                  muscle: 'Biceps',
                  image: 'assets/images/dumbbell.jpg',
                  shortDescription: 'Curl dumbbells towards shoulders.',
                  sets: '3-4',
                  reps: '10-12',
                  rest: '60 sec',
                ),
                _exerciseCard(
                  context: context,
                  title: 'Hammer Curl',
                  muscle: 'Biceps',
                  image: 'assets/images/hammer_curl.jpg',
                  shortDescription: 'Lift dumbbells with neutral grip.',
                  sets: '3',
                  reps: '10-15',
                  rest: '45 sec',
                ),
                _exerciseCard(
                  context: context,
                  title: 'Jumping Jack',
                  muscle: 'Full Body/Cardio',
                  image: 'assets/images/jumping_jack.jpg',
                  shortDescription: 'Jump with arms and legs spread.',
                  sets: '3',
                  reps: '20-30',
                  rest: '30 sec',
                ),
                _exerciseCard(
                  context: context,
                  title: 'Push-Up',
                  muscle: 'Chest, Triceps',
                  image: 'assets/images/push_up.jpg',
                  shortDescription: 'Lower body in plank position.',
                  sets: '3-5',
                  reps: '10-20',
                  rest: '60 sec',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _exerciseCard({
    required BuildContext context,
    required String title,
    required String muscle,
    required String image,
    required String shortDescription,
    required String sets,
    required String reps,
    required String rest,
  }) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded( // <<< เพิ่มบรรทัดนี้
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        image,
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(height: 100, child: Center(child: Text('Image not found'))),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(muscle, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 6),
                    Text(
                      shortDescription,
                      style: const TextStyle(fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Divider(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _infoTile('Sets', sets),
                        _infoTile('Reps', reps),
                        _infoTile('Rest', rest),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8), // เว้นระยะเล็กน้อย
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Content1()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  child: const Text('See more', style: TextStyle(fontSize: 14)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoTile(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(value),
      ],
    );
  }
}