import 'package:flutter/material.dart';

void main() {
  runApp(const StudentCampusCompanionApp());
}

class StudentCampusCompanionApp extends StatelessWidget {
  const StudentCampusCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Campus Companion',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Student Campus Companion'),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Welcome section
                const Text(
                  'Welcome, Student! 👋',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Manage your campus activities in one place.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 20),

                // Student information card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue.shade100,
                  ),

                  child: Row(
                    children: [
                      const Icon(
                        Icons.school,
                        size: 50,
                        color: Colors.blue,
                      ),

                      const SizedBox(width: 15),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Student Dashboard',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text('CSE Department'),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Campus Features',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                // Feature cards using Row and Column
                Row(
                  children: [
                    Expanded(
                      child: featureCard(
                        Icons.book,
                        'Subjects',
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: featureCard(
                        Icons.assignment,
                        'Assignments',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: featureCard(
                        Icons.schedule,
                        'Timetable',
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: featureCard(
                        Icons.account_balance_wallet,
                        'Expenses',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // Stack example
                const Text(
                  'Upcoming Event',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.orange.shade200,
                      ),
                    ),

                    const Positioned(
                      left: 20,
                      top: 25,
                      child: Icon(
                        Icons.event,
                        size: 45,
                        color: Colors.deepOrange,
                      ),
                    ),

                    const Positioned(
                      left: 80,
                      top: 25,
                      child: Text(
                        'CSE Technical Fest',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const Positioned(
                      left: 80,
                      top: 60,
                      child: Text(
                        'Upcoming Campus Event',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),

                    Positioned(
                      right: 15,
                      bottom: 15,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('View'),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Button
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.dashboard),
                    label: const Text('Explore Campus'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable feature card
  static Widget featureCard(IconData icon, String title) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.blue,
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}