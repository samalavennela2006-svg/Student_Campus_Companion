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

// ================= HOME PAGE =================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Campus Companion',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: LayoutBuilder(
            builder: (context, constraints) {

              final availableWidth = constraints.maxWidth;

              final isMobile = availableWidth < 600;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Welcome
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

                  // Profile section
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

                  // ================= QUICK ACCESS =================

                  if (isMobile)
                    Column(
                      children: [
                        campusCard(
                          context,
                          Icons.book,
                          'Subjects',
                          '6 Subjects',
                          const SubjectsPage(),
                        ),

                        const SizedBox(height: 12),

                        campusCard(
                          context,
                          Icons.assignment,
                          'Assignments',
                          '5 Pending',
                          const AssignmentsPage(),
                        ),

                        const SizedBox(height: 12),

                        campusCard(
                          context,
                          Icons.schedule,
                          'Timetable',
                          'View Schedule',
                          const TimetablePage(),
                        ),

                        const SizedBox(height: 12),

                        campusCard(
                          context,
                          Icons.account_balance_wallet,
                          'Expenses',
                          '₹2,450',
                          const ExpensesPage(),
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
                                context,
                                Icons.book,
                                'Subjects',
                                '6 Subjects',
                                const SubjectsPage(),
                              ),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: campusCard(
                                context,
                                Icons.assignment,
                                'Assignments',
                                '5 Pending',
                                const AssignmentsPage(),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                              child: campusCard(
                                context,
                                Icons.schedule,
                                'Timetable',
                                'View Schedule',
                                const TimetablePage(),
                              ),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: campusCard(
                                context,
                                Icons.account_balance_wallet,
                                'Expenses',
                                '₹2,450',
                                const ExpensesPage(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                  const SizedBox(height: 25),

                  // Upcoming Event
                  const Text(
                    'Upcoming Event',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

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
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const EventPage(),
                                    ),
                                  );
                                },
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
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const EventPage(),
                                    ),
                                  );
                                },
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ProfilePage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.person),
                      label: const Text('View Profile'),
                    ),
                  ),

                  const SizedBox(height: 20),
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

  // ================= REUSABLE CARD =================

  static Widget campusCard(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    Widget destination,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },

      child: Container(
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

              crossAxisAlignment:
                  CrossAxisAlignment.start,

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
      ),
    );
  }
}

// ================= SUBJECTS PAGE =================

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailPage(
      title: 'Subjects',
      icon: Icons.book,
      description:
          'Your current academic subjects are displayed here.',
      items: [
        'Data Analytics',
        'Computer Networks',
        'Flutter',
        'DevOps',
        'Design and Analysis of Algorithms',
        'Soft Skills',
      ],
    );
  }
}

// ================= ASSIGNMENTS PAGE =================

class AssignmentsPage extends StatelessWidget {
  const AssignmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailPage(
      title: 'Assignments',
      icon: Icons.assignment,
      description:
          'View your pending and completed assignments.',
      items: [
        'Flutter Lab Assignment',
        'Data Analytics Assignment',
        'Computer Networks Assignment',
        'DevOps Assignment',
        'DAA Assignment',
      ],
    );
  }
}

// ================= TIMETABLE PAGE =================

class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailPage(
      title: 'Timetable',
      icon: Icons.schedule,
      description:
          'View your daily class timetable and schedule.',
      items: [
        '09:00 AM - Data Analytics',
        '10:00 AM - Computer Networks',
        '11:00 AM - Flutter Lab',
        '02:00 PM - DevOps',
        '03:00 PM - DAA',
      ],
    );
  }
}

// ================= EXPENSES PAGE =================

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailPage(
      title: 'Expenses',
      icon: Icons.account_balance_wallet,
      description:
          'Track your daily campus and personal expenses.',
      items: [
        'Food - ₹800',
        'Transport - ₹500',
        'Stationery - ₹350',
        'College Events - ₹400',
        'Other Expenses - ₹400',
      ],
    );
  }
}

// ================= EVENT PAGE =================

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailPage(
      title: 'Campus Events',
      icon: Icons.event,
      description:
          'Explore upcoming events and activities on campus.',
      items: [
        'CSE Technical Fest',
        'Flutter Workshop',
        'Hackathon',
        'Coding Contest',
      ],
    );
  }
}

// ================= PROFILE PAGE =================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailPage(
      title: 'Student Profile',
      icon: Icons.person,
      description:
          'View your student profile information.',
      items: [
        'Name: Student',
        'Course: CSE',
        'College: ACE Engineering College',
        'Semester: Current Semester',
      ],
    );
  }
}

// ================= DETAIL PAGE =================

class DetailPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  final List<String> items;

  const DetailPage({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Center(
              child: Icon(
                icon,
                size: 70,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: ListView.builder(
                itemCount: items.length,

                itemBuilder: (context, index) {
                  return Card(
                    margin:
                        const EdgeInsets.only(bottom: 12),

                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '${index + 1}',
                        ),
                      ),

                      title: Text(
                        items[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigator.pop() returns to previous screen
                  Navigator.pop(context);
                },

                icon: const Icon(Icons.arrow_back),

                label: const Text(
                  'Back to Home',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}