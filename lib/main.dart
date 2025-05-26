import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
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
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _exerciseCard(
                  title: 'Dumbbell Curl',
                  muscle: 'Biceps',
                  image: 'assets/images/dumbbell.jpg',
                  steps: [
                    'Stand with feet shoulder-width apart, holding dumbbells at your sides',
                    'Keep elbows close to your torso and palms facing forward',
                    'Curl the weights toward your shoulders while contracting your biceps',
                    'Lower the weights back to starting position with control',
                  ],
                  sets: '3-4',
                  reps: '10-12',
                  rest: '60 sec',
                ),
                _exerciseCard(
                  title: 'Hammer Curl',
                  muscle: 'Biceps',
                  image: 'assets/images/hammer_curl.jpg',
                  steps: [
                    'Stand with dumbbells at your sides, palms facing your torso',
                    'Keep elbows close and fixed to your body',
                    'Lift the weights toward shoulders without twisting your wrists',
                    'Lower slowly to starting position',
                  ],
                  sets: '3',
                  reps: '10-15',
                  rest: '45 sec',
                ),
                _exerciseCard(
                  title: 'Jumping Jack',
                  muscle: 'Full Body/Cardio',
                  image: 'assets/images/jumping_jack.jpg',
                  steps: [
                    'Stand upright with feet together and hands at your sides',
                    'Jump up, spread feet shoulder-width, raise arms overhead',
                    'Jump again to return to start',
                    'Repeat in a rhythmic motion',
                  ],
                  sets: '3',
                  reps: '20-30',
                  rest: '30 sec',
                ),
                _exerciseCard(
                  title: 'Push-Up',
                  muscle: 'Chest, Triceps',
                  image: 'assets/images/push_up.jpg',
                  steps: [
                    'Start in a high plank position',
                    'Lower body until chest nearly touches the floor',
                    'Keep core tight and elbows at 45 degrees',
                    'Push back to starting position',
                  ],
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
    required String title,
    required String muscle,
    required String image,
    required List<String> steps,
    required String sets,
    required String reps,
    required String rest,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(image),
            ),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Row(
              children: [
                const Icon(Icons.push_pin, size: 16),
                const SizedBox(width: 6),
                Text(muscle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Instructions:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            ...steps.map((s) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text('${steps.indexOf(s) + 1}. $s', style: const TextStyle(fontSize: 14)),
            )),
            const Divider(),
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