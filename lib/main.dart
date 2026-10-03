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

    // Get screen information using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;

    // Responsive values
   final isSmallScreen = screenWidth < 1000;
    final isLandscape = orientation == Orientation.landscape;

    final horizontalPadding = isSmallScreen ? 16.0 : 28.0;

    final titleSize = isSmallScreen ? 26.0 : 32.0;

    final sectionTitleSize = isSmallScreen ? 20.0 : 24.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Campus Companion',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isSmallScreen ? 18 : 22,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 18,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Responsive heading
              Text(
                'Hello, Student! 👋',
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                'Welcome back to your campus companion.',
                style: TextStyle(
                  fontSize: isSmallScreen ? 14 : 17,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),

              // Responsive profile section
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(
                  isSmallScreen ? 14 : 20,
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.blue.shade50,
                ),

                child: isSmallScreen && !isLandscape
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

              Text(
                'Quick Access',
                style: TextStyle(
                  fontSize: sectionTitleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // Responsive cards
              if (isSmallScreen)
                Column(
                  children: [
                    campusCard(
                      Icons.book,
                      'Subjects',
                      '6 Subjects',
                      isSmallScreen,
                    ),

                    const SizedBox(height: 12),

                    campusCard(
                      Icons.assignment,
                      'Assignments',
                      '5 Pending',
                      isSmallScreen,
                    ),

                    const SizedBox(height: 12),

                    campusCard(
                      Icons.schedule,
                      'Timetable',
                      'View Schedule',
                      isSmallScreen,
                    ),

                    const SizedBox(height: 12),

                    campusCard(
                      Icons.account_balance_wallet,
                      'Expenses',
                      '₹2,450',
                      isSmallScreen,
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
                            false,
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: campusCard(
                            Icons.assignment,
                            'Assignments',
                            '5 Pending',
                            false,
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
                            false,
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: campusCard(
                            Icons.account_balance_wallet,
                            'Expenses',
                            '₹2,450',
                            false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              const SizedBox(height: 25),

              Text(
                'Upcoming Event',
                style: TextStyle(
                  fontSize: sectionTitleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // Responsive event section
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(
                  isSmallScreen ? 16 : 22,
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.orange.shade100,
                ),

                child: isSmallScreen
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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

              // Reminder section
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(
                  isSmallScreen ? 15 : 20,
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.green.shade50,
                ),

                child: Row(
                  children: [
                    Icon(
                      Icons.notifications_active,
                      size: isSmallScreen ? 32 : 38,
                      color: Colors.green.shade700,
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
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

                  label: Text(
                    'Explore Campus',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 14 : 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Display screen information
              Center(
                child: Text(
                  'Screen: ${screenWidth.toStringAsFixed(0)} × '
                  '${screenHeight.toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),

              const SizedBox(height: 5),

              Center(
                child: Text(
                  isLandscape
                      ? 'Landscape Mode'
                      : 'Portrait Mode',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),

              const SizedBox(height: 15),
            ],
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
    bool isSmallScreen,
  ) {
    return Container(
      width: double.infinity,

      height: isSmallScreen ? 110 : 125,

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
            size: isSmallScreen ? 32 : 38,
            color: Colors.blue,
          ),

          const SizedBox(width: 15),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                title,

                style: TextStyle(
                  fontSize: isSmallScreen ? 15 : 16,
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