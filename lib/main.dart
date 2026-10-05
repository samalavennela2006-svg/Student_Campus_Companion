import 'package:flutter/material.dart';

void main() {
  runApp(const StudentCampusCompanion());
}

// ============================================================
// APP
// ============================================================

class StudentCampusCompanion extends StatelessWidget {
  const StudentCampusCompanion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Campus Companion',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF8FF),
      ),
      home: const HomeScreen(),
    );
  }
}

// ============================================================
// HOME SCREEN - STATEFUL WIDGET
// ============================================================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 5A: State variable
  bool reminderCompleted = false;

  // 5A: setState() changes the UI
  void toggleReminder() {
    setState(() {
      reminderCompleted = !reminderCompleted;
    });
  }

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

      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 700;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Welcome
                const Text(
                  'Hello, Student! 👋',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  'Welcome back to your campus companion.',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 20),

                // Student Profile
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE1F2FF),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: isWide
                      ? const Row(
                          children: [
                            ProfileIcon(),
                            SizedBox(width: 16),
                            ProfileInformation(),
                          ],
                        )
                      : const Column(
                          children: [
                            ProfileIcon(),
                            SizedBox(height: 10),
                            ProfileInformation(),
                          ],
                        ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'Quick Access',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                // Quick Access Cards
                GridView.count(
                  crossAxisCount: isWide ? 2 : 1,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: isWide ? 3.8 : 3.4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    FeatureCard(
                      icon: Icons.book,
                      title: 'Subjects',
                      subtitle: '6 Subjects',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SubjectsScreen(),
                          ),
                        );
                      },
                    ),

                    FeatureCard(
                      icon: Icons.assignment,
                      title: 'Assignments',
                      subtitle: '5 Pending',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AssignmentsScreen(),
                          ),
                        );
                      },
                    ),

                    FeatureCard(
                      icon: Icons.access_time,
                      title: 'Timetable',
                      subtitle: 'View Schedule',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TimetableScreen(),
                          ),
                        );
                      },
                    ),

                    FeatureCard(
                      icon: Icons.account_balance_wallet,
                      title: 'Expenses',
                      subtitle: '₹2,450',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ExpensesScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Upcoming Event
                const Text(
                  'Upcoming Event',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFDFAB),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 38,
                        color: Colors.deepOrange,
                      ),
                      const SizedBox(width: 15),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CSE Technical Fest',
                              style: TextStyle(
                                fontSize: 18,
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
                              builder: (_) => const EventsScreen(),
                            ),
                          );
                        },
                        child: const Text('View Event'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // 5A STATE CHANGE
                GestureDetector(
                  onTap: toggleReminder,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: reminderCompleted
                          ? const Color(0xFFD5F5D5)
                          : const Color(0xFFE5F6E8),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          reminderCompleted
                              ? Icons.check_circle
                              : Icons.notifications_active,
                          color: Colors.green.shade700,
                          size: 32,
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                reminderCompleted
                                    ? "Today's Reminder Completed"
                                    : "Today's Reminder",
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                reminderCompleted
                                    ? 'Great! Your task is completed.'
                                    : 'Submit your Flutter Lab assignment.',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EventsScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.apps),
                    label: const Text('Explore Campus'),
                  ),
                ),
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
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
}

// ============================================================
// PROFILE WIDGETS - STATELESS WIDGETS
// ============================================================

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: const Color(0xFFEAD9FF),
      child: Icon(
        Icons.person,
        size: 36,
        color: Colors.deepPurple.shade700,
      ),
    );
  }
}

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Student Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text('CSE - Computer Science'),
        SizedBox(height: 3),
        Text('ACE Engineering College'),
      ],
    );
  }
}

// ============================================================
// FEATURE CARD - STATELESS
// ============================================================

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.blue,
              ),
              const SizedBox(width: 16),
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
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// SUBJECTS SCREEN
// ============================================================

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  final List<String> subjects = const [
    'Data Analytics',
    'Computer Networks',
    'Flutter',
    'DevOps',
    'Design and Analysis of Algorithms',
    'Soft Skills',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subjects'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(subjects[index]),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// ASSIGNMENTS SCREEN - STATEFUL
// ============================================================

class AssignmentsScreen extends StatefulWidget {
  const AssignmentsScreen({super.key});

  @override
  State<AssignmentsScreen> createState() =>
      _AssignmentsScreenState();
}

class _AssignmentsScreenState extends State<AssignmentsScreen> {
  final List<Map<String, dynamic>> assignments = [
    {
      'title': 'DAA Assignment 1',
      'subject': 'Design and Analysis of Algorithms',
      'completed': false,
    },
    {
      'title': 'DBMS Assignment 2',
      'subject': 'Database Management Systems',
      'completed': false,
    },
    {
      'title': 'CN Assignment 1',
      'subject': 'Computer Networks',
      'completed': false,
    },
    {
      'title': 'Flutter Assignment 1',
      'subject': 'Flutter',
      'completed': false,
    },
  ];

  void toggleAssignment(int index) {
    setState(() {
      assignments[index]['completed'] =
          !assignments[index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignments'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: assignments.length,
        itemBuilder: (context, index) {
          final assignment = assignments[index];

          return Card(
            child: ListTile(
              leading: Icon(
                assignment['completed']
                    ? Icons.check_circle
                    : Icons.assignment,
                color: assignment['completed']
                    ? Colors.green
                    : Colors.blue,
              ),
              title: Text(
                assignment['title'],
                style: TextStyle(
                  decoration: assignment['completed']
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              subtitle: Text(assignment['subject']),
              trailing: Checkbox(
                value: assignment['completed'],
                onChanged: (_) {
                  toggleAssignment(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// EXPENSES SCREEN - STATEFUL
// ============================================================

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Map<String, dynamic>> expenses = [
    {
      'title': 'Food',
      'amount': 1200.0,
      'category': 'Food',
      'date': '10 Sep 2026',
    },
    {
      'title': 'Transport',
      'amount': 600.0,
      'category': 'Transport',
      'date': '08 Sep 2026',
    },
    {
      'title': 'Books',
      'amount': 800.0,
      'category': 'Education',
      'date': '05 Sep 2026',
    },
  ];

  double get totalExpenses {
    return expenses.fold(
      0.0,
      (sum, item) => sum + item['amount'],
    );
  }

  Future<void> addExpense() async {
    final result = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (_) => const AddExpenseScreen(),
      ),
    );

    if (result != null) {
      // 5A: setState updates the expense list and total
      setState(() {
        expenses.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          IconButton(
            onPressed: addExpense,
            icon: const Icon(Icons.add),
          ),
        ],
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFE2F2FF),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                const Text(
                  'Total Expenses',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '₹${totalExpenses.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: expenses.isEmpty
                ? const Center(
                    child: Text('No expenses added yet.'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    itemCount: expenses.length,
                    itemBuilder: (context, index) {
                      final expense = expenses[index];

                      return Card(
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(
                              Icons.account_balance_wallet,
                            ),
                          ),
                          title: Text(expense['title']),
                          subtitle: Text(
                            '${expense['category']} • ${expense['date']}',
                          ),
                          trailing: Text(
                            '₹${expense['amount'].toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: addExpense,
        icon: const Icon(Icons.add),
        label: const Text('Add Expense'),
      ),
    );
  }
}

// ============================================================
// ADD EXPENSE SCREEN
// ============================================================

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() =>
      _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  String selectedCategory = 'Food';
  DateTime selectedDate = DateTime.now();

  final List<String> categories = [
    'Food',
    'Transport',
    'Education',
    'Entertainment',
    'Others',
  ];

  Future<void> selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void saveExpense() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final amount =
        double.tryParse(amountController.text.trim());

    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter a valid amount.'),
        ),
      );
      return;
    }

    Navigator.pop(
      context,
      {
        'title': titleController.text.trim(),
        'amount': amount,
        'category': selectedCategory,
        'date':
            '${selectedDate.day} ${_monthName(selectedDate.month)} ${selectedDate.year}',
      },
    );
  }

  String _monthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return months[month - 1];
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),

      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Expense Title',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter an expense title';
                }
                return null;
              },
            ),

            const SizedBox(height: 18),

            TextFormField(
              controller: amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Amount',
                prefixText: '₹ ',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter an amount';
                }

                final amount =
                    double.tryParse(value.trim());

                if (amount == null || amount <= 0) {
                  return 'Enter a valid amount';
                }

                return null;
              },
            ),

            const SizedBox(height: 18),

            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
              items: categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedCategory = value;
                  });
                }
              },
            ),

            const SizedBox(height: 18),

            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_month),
              title: const Text('Date'),
              subtitle: Text(
                '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
              ),
              trailing: ElevatedButton(
                onPressed: selectDate,
                child: const Text('Select Date'),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                onPressed: saveExpense,
                icon: const Icon(Icons.save),
                label: const Text(
                  'Save Expense',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// TIMETABLE SCREEN
// ============================================================

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final classes = [
      ['09:00 AM', 'DAA', 'Room C-201'],
      ['10:00 AM', 'DBMS', 'Room C-203'],
      ['11:00 AM', 'Computer Networks', 'Room C-205'],
      ['01:00 PM', 'Flutter', 'Room C-201'],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: classes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.access_time),
              title: Text(classes[index][1]),
              subtitle: Text(
                '${classes[index][0]} • ${classes[index][2]}',
              ),
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// EVENTS SCREEN
// ============================================================

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Events'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.celebration,
                color: Colors.orange,
              ),
              title: const Text('CSE Technical Fest'),
              subtitle: const Text(
                'Coding • Hackathon • Workshops',
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.code,
                color: Colors.blue,
              ),
              title: const Text('Hackathon 2026'),
              subtitle: const Text(
                'Technical Event • ACE Engineering College',
              ),
            ),
          ),
        ],
      ),
    );
  }
}