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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Campus Companion',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Welcome section
              const Text(
                'Hello, Student! 👋',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Welcome back to your campus companion.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),

              // Student profile card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.blue.shade50,
                ),

                child: Row(
                  children: [

                    // Image widget
                    ClipOval(
                      child: Image.network(
                        'https://i.pravatar.cc/150?img=47',
                        width: 75,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Student Profile',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('CSE - Computer Science'),
                        SizedBox(height: 3),
                        Text('ACE Engineering College'),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Quick Access',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // First row
              Row(
                children: [
                  Expanded(
                    child: campusCard(
                      Icons.book,
                      'Subjects',
                      '6 Subjects',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: campusCard(
                      Icons.assignment,
                      'Assignments',
                      '5 Pending',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Second row
              Row(
                children: [
                  Expanded(
                    child: campusCard(
                      Icons.schedule,
                      'Timetable',
                      'View Schedule',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: campusCard(
                      Icons.account_balance_wallet,
                      'Expenses',
                      '₹2,450',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Upcoming event
              const Text(
                'Upcoming Event',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Stack(
                children: [

                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.orange.shade100,
                    ),
                  ),

                  const Positioned(
                    left: 20,
                    top: 25,
                    child: Icon(
                      Icons.event,
                      size: 50,
                      color: Colors.deepOrange,
                    ),
                  ),

                  const Positioned(
                    left: 85,
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
                    left: 85,
                    top: 60,
                    child: Text(
                      'Coding • Hackathon • Workshops',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),

                  Positioned(
                    left: 85,
                    bottom: 20,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('View Event'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Today's reminder
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.green.shade50,
                ),

                child: Row(
                  children: [
                    Icon(
                      Icons.notifications_active,
                      size: 35,
                      color: Colors.green.shade700,
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Today\'s Reminder',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Submit your Flutter Lab assignment.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.dashboard),
                  label: const Text('Explore Campus'),
                ),
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),

      // Bottom navigation-style section
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  static Widget campusCard(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Container(
      height: 125,
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 38,
            color: Colors.blue,
          ),

          const SizedBox(height: 8),

          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}