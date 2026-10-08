import 'package:flutter/material.dart';

import 'package:provider/provider.dart';



void main() {

  runApp(

    ChangeNotifierProvider(

      create: (_) => ExpenseProvider(),

      child: const StudentCampusCompanion(),

    ),

  );

}



// ============================================================

// EXPERIMENT 5B: PROVIDER STATE MANAGEMENT

// ============================================================



class ExpenseProvider extends ChangeNotifier {

  final List<Map<String, dynamic>> _expenses = [

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



  List<Map<String, dynamic>> get expenses =>

      List.unmodifiable(_expenses);



  double get totalExpenses => _expenses.fold<double>(

        0.0,

        (sum, item) => sum + (item['amount'] as num).toDouble(),

      );



  void addExpense(Map<String, dynamic> expense) {

    _expenses.add(expense);

    notifyListeners();

  }



  void removeExpense(int index) {

    if (index >= 0 && index < _expenses.length) {

      _expenses.removeAt(index);

      notifyListeners();

    }

  }

}



// ============================================================

// EXPERIMENT 6A & 6B: CUSTOM STYLES

// ============================================================



class CampusStyles {

  static const Color primary = Color(0xFF6750A4);

  static const Color secondary = Color(0xFF9575CD);

  static const Color background = Color(0xFFFFF7FF);

  static const Color lightPurple = Color(0xFFEDE4F7);

  static const Color eventBackground = Color(0xFFFFE2B5);

  static const Color reminderBackground = Color(0xFFE4F5E8);

  static const Color textPrimary = Color(0xFF29252F);

  static const Color textSecondary = Color(0xFF77717D);



  static const TextStyle sectionHeading = TextStyle(

    fontSize: 20,

    fontWeight: FontWeight.bold,

    color: primary,

  );



  static const TextStyle cardTitle = TextStyle(

    fontSize: 16,

    fontWeight: FontWeight.w600,

    color: textPrimary,

  );



  static const TextStyle cardSubtitle = TextStyle(

    fontSize: 13,

    color: textSecondary,

  );

}



// ============================================================

// APPLICATION THEME

// EXPERIMENT 6B: THEMES AND CUSTOM STYLES

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

          seedColor: CampusStyles.primary,

          primary: CampusStyles.primary,

          secondary: CampusStyles.secondary,

          surface: CampusStyles.background,

        ),



        scaffoldBackgroundColor: CampusStyles.background,



        appBarTheme: const AppBarTheme(

          backgroundColor: CampusStyles.background,

          foregroundColor: CampusStyles.textPrimary,

          centerTitle: true,

          elevation: 0,

          titleTextStyle: TextStyle(

            fontSize: 20,

            fontWeight: FontWeight.bold,

            color: CampusStyles.textPrimary,

          ),

        ),



        cardTheme: CardThemeData(

          color: Colors.white,

          elevation: 2,

          margin: const EdgeInsets.symmetric(vertical: 6),

          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(16),

          ),

        ),



        textTheme: const TextTheme(

          headlineSmall: TextStyle(

            fontSize: 24,

            fontWeight: FontWeight.bold,

            color: CampusStyles.textPrimary,

          ),

          titleLarge: TextStyle(

            fontSize: 20,

            fontWeight: FontWeight.bold,

            color: CampusStyles.textPrimary,

          ),

          titleMedium: TextStyle(

            fontSize: 16,

            fontWeight: FontWeight.w600,

            color: CampusStyles.textPrimary,

          ),

          bodyMedium: TextStyle(

            fontSize: 14,

            color: CampusStyles.textSecondary,

          ),

        ),



        elevatedButtonTheme: ElevatedButtonThemeData(

          style: ElevatedButton.styleFrom(

            backgroundColor: CampusStyles.primary,

            foregroundColor: Colors.white,

            padding: const EdgeInsets.symmetric(

              horizontal: 20,

              vertical: 12,

            ),

            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(12),

            ),

          ),

        ),



        inputDecorationTheme: InputDecorationTheme(

          filled: true,

          fillColor: Colors.white,

          contentPadding: const EdgeInsets.symmetric(

            horizontal: 16,

            vertical: 14,

          ),

          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(12),

          ),

          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(12),

            borderSide: const BorderSide(

              color: Color(0xFFD8CDE3),

            ),

          ),

          focusedBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(12),

            borderSide: const BorderSide(

              color: CampusStyles.primary,

              width: 2,

            ),

          ),

        ),



        checkboxTheme: CheckboxThemeData(

          fillColor: WidgetStateProperty.resolveWith(

            (states) => states.contains(WidgetState.selected)

                ? CampusStyles.primary

                : null,

          ),

        ),



        floatingActionButtonTheme:

            const FloatingActionButtonThemeData(

          backgroundColor: CampusStyles.primary,

          foregroundColor: Colors.white,

        ),

      ),



      home: const HomeScreen(),

    );

  }

}



// ============================================================

// REUSABLE WIDGET: SECTION TITLE

// EXPERIMENT 6A

// ============================================================



class SectionTitle extends StatelessWidget {

  final String title;

  final IconData icon;



  const SectionTitle({

    super.key,

    required this.title,

    required this.icon,

  });



  @override

  Widget build(BuildContext context) {

    return Row(

      children: [

        Icon(

          icon,

          color: Theme.of(context).colorScheme.primary,

        ),

        const SizedBox(width: 8),

        Text(

          title,

          style: CampusStyles.sectionHeading,

        ),

      ],

    );

  }

}



// ============================================================

// HOME SCREEN

// EXPERIMENTS 3A, 3B, 4A, 4B, 5A

// ============================================================



class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});



  @override

  State<HomeScreen> createState() => _HomeScreenState();

}



class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

      late AnimationController _animationController;

      late Animation<double> _fadeAnimation;

      late Animation<Offset> _slideAnimation;

  bool reminderCompleted = false;

    @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleReminder() {

    setState(() {

      reminderCompleted = !reminderCompleted;

    });

  }



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text('Student Campus Companion'),

      ),



      body: LayoutBuilder(

        builder: (context, constraints) {

          final isWide = constraints.maxWidth >= 700;



          return SingleChildScrollView(

            padding: const EdgeInsets.all(16),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(

                  'Hello, Student! 👋',

                  style: Theme.of(context).textTheme.headlineSmall,

                ),



                const SizedBox(height: 6),



                Text(

                  'Welcome back to your campus companion.',

                  style: Theme.of(context).textTheme.bodyMedium,

                ),



                const SizedBox(height: 20),



                // Student profile

                FadeTransition(
  opacity: _fadeAnimation,
  child: SlideTransition(
    position: _slideAnimation,
    child: Container(
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
  ),
),

                      
                const SizedBox(height: 24),



                const SectionTitle(

                  title: 'Quick Access',

                  icon: Icons.dashboard,

                ),



                const SizedBox(height: 12),



                // Responsive feature cards

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

                      onTap: () => Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) => const SubjectsScreen(),

                        ),

                      ),

                    ),



                    FeatureCard(

                      icon: Icons.assignment,

                      title: 'Assignments',

                      subtitle: '5 Pending',

                      onTap: () => Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) => const AssignmentsScreen(),

                        ),

                      ),

                    ),



                    FeatureCard(

                      icon: Icons.access_time,

                      title: 'Timetable',

                      subtitle: 'View Schedule',

                      onTap: () => Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) => const TimetableScreen(),

                        ),

                      ),

                    ),



                    FeatureCard(

                      icon: Icons.account_balance_wallet,

                      title: 'Expenses',

                      subtitle:

                          '₹${context.watch<ExpenseProvider>().totalExpenses.toStringAsFixed(0)}',

                      onTap: () => Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) => const ExpensesScreen(),

                        ),

                      ),

                    ),



                    FeatureCard(

                      icon: Icons.person_add_alt_1,

                      title: 'Student Details',

                      subtitle: 'Register Your Information',

                      onTap: () => Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) => const StudentDetailsScreen(),

                        ),

                      ),

                    ),

                  ],

                ),



                const SizedBox(height: 24),



                const SectionTitle(

                  title: 'Upcoming Event',

                  icon: Icons.event,

                ),



                const SizedBox(height: 12),



                CampusEventCard(

                  title: 'CSE Technical Fest',

                  subtitle: 'Coding • Hackathon • Workshops',

                  onTap: () => Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (_) => const EventsScreen(),

                    ),

                  ),

                ),



                const SizedBox(height: 18),



                // Reminder uses setState

                GestureDetector(

                  onTap: toggleReminder,

                  child: AnimatedContainer(

                    duration: const Duration(milliseconds: 250),

                    width: double.infinity,

                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(

                      color: reminderCompleted

                          ? const Color(0xFFD5F5D5)

                          : CampusStyles.reminderBackground,

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

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                              Text(

                                reminderCompleted

                                    ? "Today's Reminder Completed"

                                    : "Today's Reminder",

                                style: CampusStyles.cardTitle,

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

                    onPressed: () => Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) => const EventsScreen(),

                      ),

                    ),

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

        selectedItemColor: CampusStyles.primary,

        unselectedItemColor: Colors.grey,

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

}



// ============================================================

// REUSABLE PROFILE WIDGETS

// ============================================================



class ProfileIcon extends StatelessWidget {

  const ProfileIcon({super.key});



  @override

  Widget build(BuildContext context) {

    return CircleAvatar(

      radius: 32,

      backgroundColor: CampusStyles.lightPurple,

      child: Icon(

        Icons.person,

        size: 36,

        color: Theme.of(context).colorScheme.primary,

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

          style: CampusStyles.cardTitle,

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

// REUSABLE FEATURE CARD

// EXPERIMENTS 2A, 2B, 6A, 6B

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

    final primary = Theme.of(context).colorScheme.primary;



    return Card(

      child: InkWell(

        borderRadius: BorderRadius.circular(16),

        onTap: onTap,

        child: Padding(

          padding: const EdgeInsets.all(16),

          child: Row(

            children: [

              Container(

                padding: const EdgeInsets.all(12),

                decoration: BoxDecoration(

                  color: primary.withValues(alpha: 0.12),

                  borderRadius: BorderRadius.circular(12),

                ),

                child: Icon(

                  icon,

                  size: 28,

                  color: primary,

                ),

              ),



              const SizedBox(width: 14),



              Expanded(

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(

                      title,

                      style: CampusStyles.cardTitle,

                    ),

                    const SizedBox(height: 4),

                    Text(

                      subtitle,

                      style: CampusStyles.cardSubtitle,

                    ),

                  ],

                ),

              ),



              const Icon(Icons.chevron_right),

            ],

          ),

        ),

      ),

    );

  }

}



// ============================================================

// REUSABLE EVENT CARD

// ============================================================



class CampusEventCard extends StatelessWidget {

  final String title;

  final String subtitle;

  final VoidCallback onTap;



  const CampusEventCard({

    super.key,

    required this.title,

    required this.subtitle,

    required this.onTap,

  });



  @override

  Widget build(BuildContext context) {

    return Card(

      color: CampusStyles.eventBackground,

      child: Padding(

        padding: const EdgeInsets.all(18),

        child: Row(

          children: [

            const Icon(

              Icons.calendar_month,

              size: 38,

              color: Colors.deepOrange,

            ),



            const SizedBox(width: 15),



            Expanded(

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(

                    title,

                    style: CampusStyles.cardTitle,

                  ),

                  const SizedBox(height: 5),

                  Text(subtitle),

                ],

              ),

            ),



            ElevatedButton(

              onPressed: onTap,

              child: const Text('View Event'),

            ),

          ],

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



  static const List<String> subjects = [

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

      appBar: AppBar(title: const Text('Subjects')),

      body: ListView.builder(

        padding: const EdgeInsets.all(16),

        itemCount: subjects.length,

        itemBuilder: (context, index) {

          return Card(

            child: ListTile(

              leading: CircleAvatar(

                backgroundColor: CampusStyles.lightPurple,

                child: Text(

                  '${index + 1}',

                  style: const TextStyle(

                    color: CampusStyles.primary,

                  ),

                ),

              ),

              title: Text(

                subjects[index],

                style: CampusStyles.cardTitle,

              ),

              trailing: const Icon(Icons.chevron_right),

            ),

          );

        },

      ),

    );

  }

}



// ============================================================

// ASSIGNMENTS SCREEN

// EXPERIMENT 5A: SETSTATE

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

      appBar: AppBar(title: const Text('Assignments')),

      body: ListView.builder(

        padding: const EdgeInsets.all(16),

        itemCount: assignments.length,

        itemBuilder: (context, index) {

          final assignment = assignments[index];

          final completed = assignment['completed'] as bool;



          return Card(

            child: ListTile(

              leading: Icon(

                completed ? Icons.check_circle : Icons.assignment,

                color: completed ? Colors.green : CampusStyles.primary,

              ),

              title: Text(

                assignment['title'],

                style: TextStyle(

                  fontWeight: FontWeight.w600,

                  decoration: completed

                      ? TextDecoration.lineThrough

                      : TextDecoration.none,

                ),

              ),

              subtitle: Text(assignment['subject']),

              trailing: Checkbox(

                value: completed,

                onChanged: (_) => toggleAssignment(index),

              ),

            ),

          );

        },

      ),

    );

  }

}



// ============================================================

// EXPENSES SCREEN

// EXPERIMENT 5B: PROVIDER

// ============================================================



class ExpensesScreen extends StatelessWidget {

  const ExpensesScreen({super.key});



  Future<void> openAddExpense(BuildContext context) async {

    final result = await Navigator.push<Map<String, dynamic>>(

      context,

      MaterialPageRoute(

        builder: (_) => const AddExpenseScreen(),

      ),

    );



    if (result != null && context.mounted) {

      context.read<ExpenseProvider>().addExpense(result);



      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(

          content: Text('Expense added successfully!'),

        ),

      );

    }

  }



  @override

  Widget build(BuildContext context) {

    final provider = context.watch<ExpenseProvider>();



    return Scaffold(

      appBar: AppBar(

        title: const Text('Expenses'),

        actions: [

          IconButton(

            onPressed: () => openAddExpense(context),

            icon: const Icon(Icons.add),

            tooltip: 'Add Expense',

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

              color: CampusStyles.lightPurple,

              borderRadius: BorderRadius.circular(18),

            ),

            child: Column(

              children: [

                const Text(

                  'Total Expenses',

                  style: CampusStyles.cardTitle,

                ),

                const SizedBox(height: 8),

                Text(

                  '₹${provider.totalExpenses.toStringAsFixed(0)}',

                  style: Theme.of(context).textTheme.headlineSmall,

                ),

              ],

            ),

          ),



          Expanded(

            child: provider.expenses.isEmpty

                ? const Center(

                    child: Text('No expenses added yet.'),

                  )

                : ListView.builder(

                    padding: const EdgeInsets.symmetric(

                      horizontal: 16,

                    ),

                    itemCount: provider.expenses.length,

                    itemBuilder: (context, index) {

                      final expense = provider.expenses[index];



                      return Card(

                        child: ListTile(

                          leading: CircleAvatar(

                            backgroundColor: CampusStyles.lightPurple,

                            child: Icon(

                              Icons.account_balance_wallet,

                              color: Theme.of(context)

                                  .colorScheme

                                  .primary,

                            ),

                          ),

                          title: Text(

                            expense['title'] as String,

                            style: CampusStyles.cardTitle,

                          ),

                          subtitle: Text(

                            '${expense['category']} • ${expense['date']}',

                          ),

                          trailing: Text(

                            '₹${(expense['amount'] as num).toStringAsFixed(0)}',

                            style: CampusStyles.cardTitle,

                          ),

                        ),

                      );

                    },

                  ),

          ),

        ],

      ),



      floatingActionButton: FloatingActionButton.extended(

        onPressed: () => openAddExpense(context),

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

    if (!formKey.currentState!.validate()) return;



    final amount = double.tryParse(amountController.text.trim());



    if (amount == null || amount <= 0) {

      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(

          content: Text('Enter a valid amount.'),

        ),

      );

      return;

    }



    Navigator.pop<Map<String, dynamic>>(

      context,

      {

        'title': titleController.text.trim(),

        'amount': amount,

        'category': selectedCategory,

        'date':

            '${selectedDate.day} ${monthName(selectedDate.month)} ${selectedDate.year}',

      },

    );

  }



  String monthName(int month) {

    const months = [

      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',

      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',

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

      appBar: AppBar(title: const Text('Add Expense')),



      body: Form(

        key: formKey,

        child: ListView(

          padding: const EdgeInsets.all(20),

          children: [

            TextFormField(

              controller: titleController,

              decoration: const InputDecoration(

                labelText: 'Expense Title',

                prefixIcon: Icon(Icons.receipt_long),

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

              keyboardType: const TextInputType.numberWithOptions(

                decimal: true,

              ),

              decoration: const InputDecoration(

                labelText: 'Amount',

                prefixText: '₹ ',

                prefixIcon: Icon(Icons.currency_rupee),

              ),

              validator: (value) {

                if (value == null || value.trim().isEmpty) {

                  return 'Please enter an amount';

                }



                final amount = double.tryParse(value.trim());



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

                prefixIcon: Icon(Icons.category),

              ),

              items: categories.map((category) {

                return DropdownMenuItem<String>(

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



            Card(

              child: ListTile(

                leading: const Icon(Icons.calendar_month),

                title: const Text('Expense Date'),

                subtitle: Text(

                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',

                ),

                trailing: TextButton(

                  onPressed: selectDate,

                  child: const Text('Select Date'),

                ),

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

      appBar: AppBar(title: const Text('Timetable')),

      body: ListView.builder(

        padding: const EdgeInsets.all(16),

        itemCount: classes.length,

        itemBuilder: (context, index) {

          return Card(

            child: ListTile(

              leading: CircleAvatar(

                backgroundColor: CampusStyles.lightPurple,

                child: const Icon(

                  Icons.access_time,

                  color: CampusStyles.primary,

                ),

              ),

              title: Text(

                classes[index][1],

                style: CampusStyles.cardTitle,

              ),

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

      appBar: AppBar(title: const Text('Campus Events')),

      body: ListView(

        padding: const EdgeInsets.all(16),

        children: [

          Card(

            child: ListTile(

              leading: const CircleAvatar(

                backgroundColor: CampusStyles.eventBackground,

                child: Icon(

                  Icons.celebration,

                  color: Colors.deepOrange,

                ),

              ),

              title: const Text(

                'CSE Technical Fest',

                style: CampusStyles.cardTitle,

              ),

              subtitle: const Text(

                'Coding • Hackathon • Workshops',

              ),

            ),

          ),



          Card(

            child: ListTile(

              leading: const CircleAvatar(

                backgroundColor: CampusStyles.lightPurple,

                child: Icon(

                  Icons.code,

                  color: CampusStyles.primary,

                ),

              ),

              title: const Text(

                'Hackathon 2026',

                style: CampusStyles.cardTitle,

              ),

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



// ============================================================

// EXPERIMENT 7A & 7B

// FORMS, INPUT FIELDS, FORM VALIDATION

// AND ERROR HANDLING

// ============================================================



class StudentDetailsScreen extends StatefulWidget {

  const StudentDetailsScreen({super.key});



  @override

  State<StudentDetailsScreen> createState() =>

      _StudentDetailsScreenState();

}



class _StudentDetailsScreenState extends State<StudentDetailsScreen> {

  final formKey = GlobalKey<FormState>();



  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final rollNumberController = TextEditingController();



  String? selectedDepartment;

  String? selectedYear;

  String? selectedGender;

  DateTime? selectedDate;



  bool genderError = false;

  bool dateError = false;



  final departments = [

    'CSE',

    'ECE',

    'EEE',

    'Mechanical',

    'Civil',

    'IT',

  ];



  final academicYears = [

    '1st Year',

    '2nd Year',

    '3rd Year',

    '4th Year',

  ];



  Future<void> chooseDate() async {

    final picked = await showDatePicker(

      context: context,

      initialDate: DateTime(2005),

      firstDate: DateTime(1990),

      lastDate: DateTime.now(),

      helpText: 'Select Date of Birth',

    );



    if (picked != null) {

      setState(() {

        selectedDate = picked;

        dateError = false;

      });

    }

  }



  void submitForm() {

    final isFormValid = formKey.currentState!.validate();



    setState(() {

      genderError = selectedGender == null;

      dateError = selectedDate == null;

    });



    if (!isFormValid || genderError || dateError) {

      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(

          content: Text('Please correct the highlighted fields.'),

          behavior: SnackBarBehavior.floating,

        ),

      );

      return;

    }



    showDialog(

      context: context,

      builder: (dialogContext) => AlertDialog(

        title: const Text('Registration Successful'),

        content: SingleChildScrollView(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisSize: MainAxisSize.min,

            children: [

              Text('Name: ${nameController.text.trim()}'),

              const SizedBox(height: 8),

              Text('Email: ${emailController.text.trim()}'),

              const SizedBox(height: 8),

              Text('Phone: ${phoneController.text.trim()}'),

              const SizedBox(height: 8),

              Text('Roll Number: ${rollNumberController.text.trim()}'),

              const SizedBox(height: 8),

              Text('Department: $selectedDepartment'),

              const SizedBox(height: 8),

              Text('Academic Year: $selectedYear'),

              const SizedBox(height: 8),

              Text('Gender: $selectedGender'),

              const SizedBox(height: 8),

              Text(

                'Date of Birth: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',

              ),

            ],

          ),

        ),

        actions: [

          ElevatedButton(

            onPressed: () => Navigator.pop(dialogContext),

            child: const Text('Done'),

          ),

        ],

      ),

    );

  }



  @override

  void dispose() {

    nameController.dispose();

    emailController.dispose();

    phoneController.dispose();

    rollNumberController.dispose();

    super.dispose();

  }



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text('Student Details'),

      ),



      body: Form(

        key: formKey,

        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: ListView(

          padding: const EdgeInsets.all(20),

          children: [

            const Icon(

              Icons.school_rounded,

              size: 56,

              color: CampusStyles.primary,

            ),



            const SizedBox(height: 12),



            Text(

              'Student Registration',

              textAlign: TextAlign.center,

              style: Theme.of(context).textTheme.headlineSmall,

            ),



            const SizedBox(height: 6),



            const Text(

              'Enter your details in the form below.',

              textAlign: TextAlign.center,

              style: CampusStyles.cardSubtitle,

            ),



            const SizedBox(height: 28),



            TextFormField(

              controller: nameController,

              textCapitalization: TextCapitalization.words,

              decoration: const InputDecoration(

                labelText: 'Full Name',

                hintText: 'Enter your full name',

                prefixIcon: Icon(Icons.person_outline),

              ),

              validator: (value) {

                final name = value?.trim() ?? '';



                if (name.isEmpty) {

                  return 'Please enter your name';

                }



                if (name.length < 3) {

                  return 'Name must contain at least 3 characters';

                }



                if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(name)) {

                  return 'Name can contain only letters and spaces';

                }



                return null;

              },

            ),



            const SizedBox(height: 18),



            TextFormField(

              controller: emailController,

              keyboardType: TextInputType.emailAddress,

              decoration: const InputDecoration(

                labelText: 'Email Address',

                hintText: 'example@email.com',

                prefixIcon: Icon(Icons.email_outlined),

              ),

              validator: (value) {

                final email = value?.trim() ?? '';



                if (email.isEmpty) {

                  return 'Please enter your email';

                }



                if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')

                    .hasMatch(email)) {

                  return 'Please enter a valid email';

                }



                return null;

              },

            ),



            const SizedBox(height: 18),



            TextFormField(

              controller: phoneController,

              keyboardType: TextInputType.phone,

              maxLength: 10,

              decoration: const InputDecoration(

                labelText: 'Phone Number',

                hintText: 'Enter 10-digit phone number',

                prefixIcon: Icon(Icons.phone_outlined),

                counterText: '',

              ),

              validator: (value) {

                final phone = value?.trim() ?? '';



                if (!RegExp(r'^[0-9]{10}$').hasMatch(phone)) {

                  return 'Enter a valid 10-digit phone number';

                }



                return null;

              },

            ),



            const SizedBox(height: 18),



            TextFormField(

              controller: rollNumberController,

              textCapitalization: TextCapitalization.characters,

              decoration: const InputDecoration(

                labelText: 'Roll Number',

                hintText: 'Enter your roll number',

                prefixIcon: Icon(Icons.badge_outlined),

              ),

              validator: (value) {

                final rollNumber = value?.trim() ?? '';



                if (rollNumber.isEmpty) {

                  return 'Please enter your roll number';

                }



                if (rollNumber.length < 4) {

                  return 'Enter a valid roll number';

                }



                return null;

              },

            ),



            const SizedBox(height: 18),



            DropdownButtonFormField<String>(

              value: selectedDepartment,

              decoration: const InputDecoration(

                labelText: 'Department',

                prefixIcon: Icon(Icons.account_balance_outlined),

              ),

              items: departments.map((department) {

                return DropdownMenuItem<String>(

                  value: department,

                  child: Text(department),

                );

              }).toList(),

              onChanged: (value) {

                setState(() {

                  selectedDepartment = value;

                });

              },

              validator: (value) {

                if (value == null || value.isEmpty) {

                  return 'Please select your department';

                }



                return null;

              },

            ),



            const SizedBox(height: 18),



            DropdownButtonFormField<String>(

              value: selectedYear,

              decoration: const InputDecoration(

                labelText: 'Academic Year',

                prefixIcon: Icon(Icons.calendar_today_outlined),

              ),

              items: academicYears.map((year) {

                return DropdownMenuItem<String>(

                  value: year,

                  child: Text(year),

                );

              }).toList(),

              onChanged: (value) {

                setState(() {

                  selectedYear = value;

                });

              },

              validator: (value) {

                if (value == null || value.isEmpty) {

                  return 'Please select your academic year';

                }



                return null;

              },

            ),



            const SizedBox(height: 18),



            Card(

              child: Padding(

                padding: const EdgeInsets.symmetric(

                  horizontal: 12,

                  vertical: 8,

                ),

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    const Text(

                      'Gender',

                      style: CampusStyles.cardTitle,

                    ),



                    RadioListTile<String>(

                      title: const Text('Female'),

                      value: 'Female',

                      groupValue: selectedGender,

                      onChanged: (value) {

                        setState(() {

                          selectedGender = value;

                          genderError = false;

                        });

                      },

                    ),



                    RadioListTile<String>(

                      title: const Text('Male'),

                      value: 'Male',

                      groupValue: selectedGender,

                      onChanged: (value) {

                        setState(() {

                          selectedGender = value;

                          genderError = false;

                        });

                      },

                    ),



                    RadioListTile<String>(

                      title: const Text('Prefer not to say'),

                      value: 'Prefer not to say',

                      groupValue: selectedGender,

                      onChanged: (value) {

                        setState(() {

                          selectedGender = value;

                          genderError = false;

                        });

                      },

                    ),



                    if (genderError)

                      const Padding(

                        padding: EdgeInsets.only(

                          left: 12,

                          bottom: 8,

                        ),

                        child: Text(

                          'Please select your gender',

                          style: TextStyle(

                            color: Colors.red,

                          ),

                        ),

                      ),

                  ],

                ),

              ),

            ),



            const SizedBox(height: 18),



            Card(

              child: ListTile(

                leading: const Icon(

                  Icons.calendar_month,

                  color: CampusStyles.primary,

                ),

                title: const Text('Date of Birth'),

                subtitle: Text(

                  selectedDate == null

                      ? 'No date selected'

                      : '${selectedDate!.day}/'

                          '${selectedDate!.month}/'

                          '${selectedDate!.year}',

                ),

                trailing: TextButton(

                  onPressed: chooseDate,

                  child: const Text('Choose'),

                ),

              ),

            ),



            if (dateError)

              const Padding(

                padding: EdgeInsets.only(

                  left: 12,

                  top: 6,

                ),

                child: Text(

                  'Please select your date of birth',

                  style: TextStyle(

                    color: Colors.red,

                  ),

                ),

              ),



            const SizedBox(height: 28),



            SizedBox(

              height: 52,

              child: ElevatedButton.icon(

                onPressed: submitForm,

                icon: const Icon(Icons.check_circle_outline),

                label: const Text(

                  'Submit Details',

                  style: TextStyle(fontSize: 16),

                ),

              ),

            ),



            const SizedBox(height: 20),

          ],

        ),

      ),

    );

  }

}