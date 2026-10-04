import 'package:flutter/material.dart';

void main() {
  runApp(const StudentCampusCompanion());
}

class StudentCampusCompanion extends StatelessWidget {
  const StudentCampusCompanion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Campus Companion',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFFFF7FF),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// ------------------------------------------------------------
// HOME PAGE
// ------------------------------------------------------------

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomeDashboard(),
    EventsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.event_outlined),
            selectedIcon: Icon(Icons.event),
            label: 'Events',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// HOME DASHBOARD
// ------------------------------------------------------------

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  void openPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Campus Companion',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int columns = constraints.maxWidth >= 700 ? 2 : 1;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello, Student! 👋',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  'Welcome back to your campus companion.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 20),

                // STUDENT PROFILE
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE1F2FF),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: screenWidth < 600
                      ? const Column(
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundColor: Color(0xFFE8D9FF),
                              child: Icon(
                                Icons.person,
                                size: 38,
                                color: Colors.deepPurple,
                              ),
                            ),
                            SizedBox(height: 10),
                            ProfileText(),
                          ],
                        )
                      : const Row(
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundColor: Color(0xFFE8D9FF),
                              child: Icon(
                                Icons.person,
                                size: 38,
                                color: Colors.deepPurple,
                              ),
                            ),
                            SizedBox(width: 16),
                            ProfileText(),
                          ],
                        ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Quick Access',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                // QUICK ACCESS CARDS
                GridView.count(
                  crossAxisCount: columns,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: columns == 2 ? 2.8 : 3.2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    DashboardCard(
                      icon: Icons.book,
                      title: 'Subjects',
                      subtitle: '6 Subjects',
                      onTap: () {
                        openPage(context, const SubjectsPage());
                      },
                    ),
                    DashboardCard(
                      icon: Icons.assignment,
                      title: 'Assignments',
                      subtitle: '5 Pending',
                      onTap: () {
                        openPage(context, const AssignmentsPage());
                      },
                    ),
                    DashboardCard(
                      icon: Icons.access_time,
                      title: 'Timetable',
                      subtitle: 'View Schedule',
                      onTap: () {
                        openPage(context, const TimetablePage());
                      },
                    ),
                    DashboardCard(
                      icon: Icons.account_balance_wallet,
                      title: 'Expenses',
                      subtitle: 'Manage Expenses',
                      onTap: () {
                        openPage(context, const ExpensesPage());
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 25),

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
                    color: const Color(0xFFFFDEAD),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < 500) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              size: 40,
                              color: Colors.deepOrange,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'CSE Technical Fest',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Coding • Hackathon • Workshops',
                            ),
                            const SizedBox(height: 12),
                            EventButton(
                              onPressed: () {
                                openPage(context, const EventsPage());
                              },
                            ),
                          ],
                        );
                      }

                      return Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            size: 40,
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
                          EventButton(
                            onPressed: () {
                              openPage(context, const EventsPage());
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3F6E8),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.notifications_active,
                        color: Colors.green,
                        size: 30,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today's Reminder",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
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

                const SizedBox(height: 20),

                Center(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.apps),
                    label: const Text('Explore Campus'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ------------------------------------------------------------
// PROFILE WIDGET
// ------------------------------------------------------------

class ProfileText extends StatelessWidget {
  const ProfileText({super.key});

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
        Text('ACE Engineering College'),
      ],
    );
  }
}

// ------------------------------------------------------------
// DASHBOARD CARD
// ------------------------------------------------------------

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const DashboardCard({
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.blue,
                size: 30,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
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
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// EVENT BUTTON
// ------------------------------------------------------------

class EventButton extends StatelessWidget {
  final VoidCallback onPressed;

  const EventButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: const Text('View Event'),
    );
  }
}

// ------------------------------------------------------------
// SUBJECTS PAGE
// ------------------------------------------------------------

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final subjects = [
      'Data Analytics',
      'Computer Networks',
      'Flutter',
      'DevOps',
      'Design and Analysis of Algorithms',
      'Soft Skills',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Subjects'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFE8D9FF),
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

// ------------------------------------------------------------
// ASSIGNMENTS PAGE
// ------------------------------------------------------------

class AssignmentsPage extends StatelessWidget {
  const AssignmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final assignments = [
      'Data Analytics Assignment',
      'Computer Networks Seminar',
      'Flutter Lab',
      'DevOps Assignment',
      'DAA Practice',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignments'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: assignments.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(
                Icons.assignment,
                color: Colors.blue,
              ),
              title: Text(assignments[index]),
              subtitle: const Text('Pending'),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}

// ------------------------------------------------------------
// TIMETABLE PAGE
// ------------------------------------------------------------

class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final timetable = [
      ['09:00 AM', 'Data Analytics'],
      ['10:00 AM', 'Computer Networks'],
      ['11:00 AM', 'Flutter'],
      ['01:30 PM', 'DevOps'],
      ['02:30 PM', 'DAA'],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: timetable.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(
                Icons.access_time,
                color: Colors.blue,
              ),
              title: Text(timetable[index][1]),
              subtitle: Text(timetable[index][0]),
            ),
          );
        },
      ),
    );
  }
}

// ------------------------------------------------------------
// EXPENSES PAGE - 4B
// ------------------------------------------------------------

class Expense {
  final String title;
  final double amount;
  final String category;
  final DateTime date;

  Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });
}

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  final List<Expense> expenses = [
    Expense(
      title: 'College Bus',
      amount: 500,
      category: 'Transport',
      date: DateTime(2026, 9, 25),
    ),
    Expense(
      title: 'Lunch',
      amount: 250,
      category: 'Food',
      date: DateTime(2026, 9, 26),
    ),
  ];

  void openAddExpensePage() async {
    final Expense? newExpense = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddExpensePage(),
      ),
    );

    if (newExpense != null) {
      setState(() {
        expenses.add(newExpense);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double total = 0;

    for (final expense in expenses) {
      total += expense.amount;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(18),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFE8D9FF),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                const Text(
                  'Total Expenses',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '₹${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 28,
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
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    itemCount: expenses.length,
                    itemBuilder: (context, index) {
                      final expense = expenses[index];

                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue.shade50,
                            child: const Icon(
                              Icons.currency_rupee,
                              color: Colors.blue,
                            ),
                          ),
                          title: Text(
                            expense.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '${expense.category} • ${formatDate(expense.date)}',
                          ),
                          trailing: Text(
                            '₹${expense.amount.toStringAsFixed(2)}',
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
        onPressed: openAddExpensePage,
        icon: const Icon(Icons.add),
        label: const Text('Add Expense'),
      ),
    );
  }
}

// ------------------------------------------------------------
// ADD EXPENSE PAGE - 4B
// ------------------------------------------------------------

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  String selectedCategory = 'Food';

  DateTime selectedDate = DateTime.now();

  final List<String> categories = [
    'Food',
    'Transport',
    'Education',
    'Shopping',
    'Entertainment',
    'Other',
  ];

  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void saveExpense() {
    if (_formKey.currentState!.validate()) {
      final expense = Expense(
        title: titleController.text.trim(),
        amount: double.parse(amountController.text.trim()),
        category: selectedCategory,
        date: selectedDate,
      );

      Navigator.pop(context, expense);
    }
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add New Expense',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Enter the details of your expense below.',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 25),

              // TITLE
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Expense Title',
                  hintText: 'Example: Lunch',
                  prefixIcon: Icon(Icons.title),
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

              // AMOUNT
              TextFormField(
                controller: amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  hintText: 'Example: 250',
                  prefixIcon: Icon(Icons.currency_rupee),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter an amount';
                  }

                  final amount = double.tryParse(value.trim());

                  if (amount == null) {
                    return 'Please enter a valid number';
                  }

                  if (amount <= 0) {
                    return 'Amount must be greater than zero';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 18),

              // CATEGORY
              DropdownButtonFormField<String>(
                initialValue: selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  prefixIcon: Icon(Icons.category),
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

              // DATE PICKER
              InkWell(
                onTap: selectDate,
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Date',
                    prefixIcon: Icon(Icons.calendar_month),
                    border: OutlineInputBorder(),
                  ),
                  child: Text(
                    formatDate(selectedDate),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // SAVE BUTTON
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: saveExpense,
                  icon: const Icon(Icons.save),
                  label: const Text(
                    'Save Expense',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// EVENTS PAGE
// ------------------------------------------------------------

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Events'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(
                Icons.calendar_month,
                color: Colors.deepOrange,
              ),
              title: Text('CSE Technical Fest'),
              subtitle: Text(
                'Coding • Hackathon • Workshops',
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.school,
                color: Colors.blue,
              ),
              title: Text('Workshop on Flutter'),
              subtitle: Text(
                'Learn Flutter development basics.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// PROFILE PAGE
// ------------------------------------------------------------

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFE8D9FF),
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Student',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text('CSE - Computer Science'),
            Text('ACE Engineering College'),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// HELPER FUNCTION
// ------------------------------------------------------------

String formatDate(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}/'
      '${date.month.toString().padLeft(2, '0')}/'
      '${date.year}';
}