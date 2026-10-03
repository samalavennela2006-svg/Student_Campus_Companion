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
          padding: const EdgeInsets.all(20),

          // LayoutBuilder checks the available space
          child: LayoutBuilder(
            builder: (context, constraints) {

              final availableWidth = constraints.maxWidth;

              // Layout breakpoints
              final isMobile = availableWidth < 600;
              final isTablet = availableWidth >= 600 &&
                  availableWidth < 1000;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Welcome section
                  Text(
                    'Hello, Student! 👋',
                    style: TextStyle(
                      fontSize: isMobile ? 26 : 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    'Welcome back to your campus companion.',
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 17,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Student Profile
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: isMobile
                        ? const Column(
                            children: [
                              CircleAvatar(
                                radius: 38,
                                child: Icon(
                                  Icons.person,
                                  size: 45,
                                ),
                              ),

                              SizedBox(height: 12),

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
                          )
                        : const Row(
                            children: [
                              CircleAvatar(
                                radius: 38,
                                child: Icon(
                                  Icons.person,
                                  size: 45,
                                ),
                              ),

                              SizedBox(width: 15),

                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
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
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // LayoutBuilder decides the card arrangement
                  if (isMobile)
                    Column(
                      children: [
                        campusCard(
                          Icons.book,
                          'Subjects',
                          '6 Subjects',
                        ),

                        const SizedBox(height: 12),

                        campusCard(
                          Icons.assignment,
                          'Assignments',
                          '5 Pending',
                        ),

                        const SizedBox(height: 12),

                        campusCard(
                          Icons.schedule,
                          'Timetable',
                          'View Schedule',
                        ),

                        const SizedBox(height: 12),

                        campusCard(
                          Icons.account_balance_wallet,
                          'Expenses',
                          '₹2,450',
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
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
                      ],
                    ),

                  const SizedBox(height: 25),

                  const Text(
                    'Upcoming Event',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Adaptive event layout
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: isMobile
                        ? Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.event,
                                size: 45,
                                color: Colors.deepOrange,
                              ),

                              const SizedBox(height: 10),

                              const Text(
                                'CSE Technical Fest',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 5),

                              const Text(
                                'Coding • Hackathon • Workshops',
                              ),

                              const SizedBox(height: 12),

                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('View Event'),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              const Icon(
                                Icons.event,
                                size: 50,
                                color: Colors.deepOrange,
                              ),

                              const SizedBox(width: 18),

                              const Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'CSE Technical Fest',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(height: 5),

                                    Text(
                                      'Coding • Hackathon • Workshops',
                                    ),
                                  ],
                                ),
                              ),

                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('View Event'),
                              ),
                            ],
                          ),
                  ),

                  const SizedBox(height: 25),

                  // Reminder
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: const Row(
                      children: [
                        Icon(
                          Icons.notifications_active,
                          size: 36,
                          color: Colors.green,
                        ),

                        SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today's Reminder",
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

                  const SizedBox(height: 20),

                  // Shows the current LayoutBuilder constraint
                  Center(
                    child: Text(
                      'Available Width: '
                      '${availableWidth.toStringAsFixed(0)} px',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Center(
                    child: Text(
                      isMobile
                          ? 'Mobile Layout'
                          : isTablet
                              ? 'Tablet Layout'
                              : 'Desktop Layout',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                ],
              );
            },
          ),
        ),
      ),

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
      width: double.infinity,
      height: 115,

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

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Icon(
            icon,
            size: 35,
            color: Colors.blue,
          ),

          const SizedBox(width: 15),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
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
        ],
      ),
    );
  }
}