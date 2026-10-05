# Student Campus Companion

## Abstract

The Student Campus Companion is a Flutter-based application developed to
help students manage and access their important academic and campus-related
activities in a simple and organized way. The application provides an
easy-to-use interface for displaying information such as subjects,
assignments, timetable, expenses, campus events, and student profile.

The project is developed step by step by implementing different Flutter
concepts through experiments. It includes Flutter and Dart basics,
different widgets and layouts, responsive user interface design,
navigation, state management, custom widgets, forms, animations, REST API
integration, and testing.

This project helps in understanding the practical implementation of Flutter
concepts while developing a useful application for students. The Student
Campus Companion can be further improved in the future by adding features
such as notifications, reminders, attendance tracking, academic progress,
and personalized student information.

---

## Experiment 1A – Flutter and Dart Basics

In this experiment, I created the basic Student Campus Companion project
and worked with basic Dart concepts such as variables, data types,
Boolean values, conditional expressions, and console output.

The initial application foundation was created for developing the Student
Campus Companion in the upcoming experiments.

### Experiment 1A Output

The output of Experiment 1A displays basic student and application
information using Dart console statements.

![Experiment 1A Output](images/exp_1a_output.png)

---

## Experiment 1B – Basic Flutter Application

In this experiment, I developed the initial user interface of the Student
Campus Companion using Flutter.

The application uses basic Flutter components such as MaterialApp,
Scaffold, AppBar, Center, and Text to create the first application screen.

The screen displays the Student Campus Companion title and a welcome
message for the student.

### Experiment 1B Output

The following screenshot shows the initial Flutter user interface of the
Student Campus Companion after completing Experiment 1B.

![Experiment 1B Output](images/exp_1b_output.png)

---

## Experiment 2A – Flutter Widgets and Layouts

In this experiment, I explored commonly used Flutter widgets and layout
structures to improve the Student Campus Companion interface.

The application uses widgets such as Text, Icon, Container, and
ElevatedButton. Row and Column are used to arrange the campus features,
while Stack is used to create the upcoming event section.

A student dashboard was created containing sections for Subjects,
Assignments, Timetable, Expenses, and Upcoming Campus Events.

This experiment helped in understanding widget nesting and layout
management in Flutter.

### Experiment 2A Output

The following screenshot shows the Student Campus Companion dashboard
after implementing Flutter widgets and layout structures.

![Experiment 2A Output](images/exp_2a_output.png)

---

## Experiment 2B – Enhanced Student Campus Companion UI

In this experiment, I enhanced the Student Campus Companion interface by
using additional Flutter widgets, styling, spacing, and layout structures.

A student profile section was added using a CircleAvatar and Icon. The
dashboard was further improved with quick-access cards for Subjects,
Assignments, Timetable, and Expenses.

An upcoming campus event section, today's reminder, an Explore Campus
button, and a bottom navigation bar were also added to make the interface
more complete.

This experiment further improved the understanding of widget nesting,
Row, Column, Stack, Container, CircleAvatar, Icon, and ElevatedButton
widgets.

### Experiment 2B Output

The following screenshot shows the enhanced Student Campus Companion
interface after completing Experiment 2B.

![Experiment 2B Output](images/exp_2b_output.png)

---

## Experiment 3A – Responsive UI Using MediaQuery

In this experiment, I made the Student Campus Companion responsive
using the MediaQuery widget in Flutter.

MediaQuery was used to obtain information about the available screen
width, screen height, and device orientation. Based on the screen size,
the application automatically adjusts the arrangement and sizing of
different UI elements.

The Quick Access cards for Subjects, Assignments, Timetable, and
Expenses are displayed in a two-column layout on wider screens and
change to a single-column layout on smaller screens.

The Student Profile section, text sizes, spacing, event section, and
other UI elements are also adjusted according to the available screen
size. The application detects both portrait and landscape orientations.

This experiment helped me understand how MediaQuery can be used to
create responsive Flutter interfaces that adapt to different screen
sizes and orientations.

### Experiment 3A Output

The following screenshots demonstrate the responsive behavior of the
Student Campus Companion using MediaQuery.

#### Wide Screen

The dashboard displays the Quick Access cards in a two-column layout
when sufficient screen width is available.

![Experiment 3A Wide Screen](images/exp_3a_wide.png)

#### Small Screen

On a smaller screen, the Quick Access cards automatically change to a
single-column layout. The profile section and other UI elements also
adapt to the available screen size.

![Experiment 3A Small Screen](images/exp_3a_small.png)

---

## Experiment 3B – Adaptive Layout Using LayoutBuilder

In this experiment, I further improved the responsive design of the
Student Campus Companion by using the LayoutBuilder widget.

LayoutBuilder was used to obtain the available width provided by the
parent widget through layout constraints. Based on the available width,
the application automatically adjusts the arrangement of the user
interface for different screen sizes.

The Quick Access cards are arranged according to the available space.
On medium-sized screens, the cards are displayed in an adaptive
two-column layout, while on wider screens the layout makes use of the
additional horizontal space.

The Student Profile and Upcoming Event sections also adapt their
arrangement according to the available layout constraints.

The application uses Expanded widgets to distribute available space
between cards and help prevent layout overflow.

This experiment helped me understand how LayoutBuilder and layout
constraints can be used to create flexible and adaptive Flutter
interfaces for different screen sizes.

### Experiment 3B Output

The following screenshots demonstrate the adaptive behavior of the
Student Campus Companion using LayoutBuilder.

#### Tablet Layout

When the available width is medium-sized, the Quick Access cards are
arranged using an adaptive two-column layout.

![Experiment 3B Tablet Layout](images/exp_3b_tablet.png)

#### Desktop Layout

When more horizontal space is available, the application adapts the
dashboard to make effective use of the wider screen.

![Experiment 3B Desktop Layout](images/exp_3b_desktop.png)

---

## Experiment 4A – Navigation Using Navigator

In this experiment, I implemented navigation between different screens
in the Student Campus Companion using the Navigator class in Flutter.

The application was extended from a single dashboard into multiple
screens for Subjects, Assignments, Timetable, Expenses, Campus Events,
and Student Profile.

Navigator.push() is used to open a new screen from the Home screen,
while Navigator.pop() is used to return to the previous screen.

The Quick Access cards and other buttons were made interactive so that
students can navigate to the corresponding sections of the application.

Each screen displays relevant information for that section and provides
a Back button to return to the previous screen.

This experiment helped me understand Flutter's navigation system,
routes, Navigator.push(), Navigator.pop(), and stack-based navigation.

### Experiment 4A Output

The following screenshots demonstrate navigation between different
screens in the Student Campus Companion using Navigator.

#### Home Screen

The Home screen provides Quick Access cards for navigating to the
different sections of the application.

![Experiment 4A Home Screen](images/exp_4a_home.png)

#### Subjects Screen

The Subjects card opens the Subjects screen using Navigator.push().

![Experiment 4A Subjects Screen](images/exp_4a_subjects.png)

---

## Experiment 4B – User Input and Form Validation

In this experiment, I added user input functionality to the Student Campus Companion.

An expense form was created to allow students to enter an expense title, amount, category, and date.

The form uses TextFormField for entering the expense title and amount. A DropdownButtonFormField is used to select the expense category, and a Date Picker is used to select the expense date.

Form validation was added to check whether the required fields are entered correctly. The amount is also validated to ensure that a valid number greater than zero is entered.

After entering the required details, the user can click the Save Expense button. The entered expense is then added to the Expenses page and the total expense amount is updated.

This experiment helped me understand user input, forms, validation, date selection, dropdown menus, and handling user-entered data in Flutter.

### Experiment 4B Output

The following screenshots demonstrate the user input and expense management functionality implemented in the Student Campus Companion.

#### Add Expense Form

The Add Expense screen allows the student to enter the expense title, amount, category, and date.

![Experiment 4B Add Expense](images/exp_4b_add_expense.png)

#### Date Picker

The Date Picker allows the student to select the date on which the expense occurred.

![Experiment 4B Date Picker](images/exp_4b_date_picker.png)

#### Saved Expense

After entering valid details and clicking the Save Expense button, the expense is displayed on the Expenses page and the total amount is updated.

![Experiment 4B Saved Expense](images/exp_4b_saved_expense.png)

---

## Experiment 5A – Stateful and Stateless Widgets

In this experiment, I learned the difference between StatefulWidget and
StatelessWidget and implemented state management using Flutter's
setState() method.

Stateless widgets were used for UI components whose values do not change,
such as the student profile and quick-access cards.

Stateful widgets were used for components whose data can change during
runtime. The Home screen uses setState() to update the Today's Reminder
when it is marked as completed.

The Assignments screen uses setState() to update the completion status of
assignments. When an assignment is marked as completed, its icon and text
are updated immediately.

The Expenses screen also uses setState() to update the expense list and
total amount when a new expense is added.

This experiment helped me understand how StatefulWidget, StatelessWidget,
and setState() are used to manage changing data and update the Flutter
user interface dynamically.

### Experiment 5A Output

The following screenshots demonstrate the state changes implemented using
StatefulWidget and setState().

#### Today's Reminder State Change

The reminder changes from pending to completed when the user taps on it.
The UI updates immediately without restarting the application.

![Experiment 5A Reminder](images/exp_5a_reminder.png)

#### Assignment State Change

The assignment status changes when the checkbox is selected. The completed
assignment is displayed with a completed icon and strikethrough text.

![Experiment 5A Assignment](images/exp_5a_assignment.png)

#### Expense State Change

After adding a new expense, the expense list and total expense amount are
updated automatically using setState().

![Experiment 5A Expense](images/exp_5a_expense.png)

---

## Experiment 5B – Provider State Management

In this experiment, I implemented Provider-based state management in the
Student Campus Companion using the `provider` package.

The `ChangeNotifier` class was used to create an `ExpenseProvider` that
manages the expense data separately from the user interface.

The `ChangeNotifierProvider` was used to provide the expense state to the
application. The `Provider.of` and `context.watch` methods were used to
access and listen to the expense data from different widgets.

When a new expense is added, the `addExpense()` method updates the expense
list and calls `notifyListeners()`. This automatically updates the expense
list and total expense amount displayed on the screen.

Unlike the previous experiment, where state was handled using `setState()`,
this experiment demonstrates how Provider can be used to manage and share
application state in a more organized way.

This experiment helped me understand centralized state management using
Provider, ChangeNotifier, and notifyListeners() in Flutter.

### Experiment 5B Output

The following screenshots demonstrate the Provider-based state management
implemented in the Student Campus Companion.

#### Expense Before Adding

The Expenses screen displays the existing expense list and the current
total expense amount.

![Experiment 5B Expense Screen](images/exp_5b_expense_before.png)

#### Adding a New Expense

A new expense can be entered using the Add Expense form. After saving,
the expense is added to the Provider-managed expense list.

![Experiment 5B Add Expense](images/exp_5b_add_expense.png)

#### Updated Expense List

After adding the expense, the Expenses screen automatically updates the
expense list and total amount using Provider and notifyListeners().

![Experiment 5B Updated Expense](images/exp_5b_expense_after.png)

---

## Expected Final Application

The following sample image shows the expected design of the Student Campus
Companion application after completing the planned features.

![Expected Final Application](screenshots/expexted_final_app.png)

---

## Future Enhancements

- Add and manage student assignments
- Add subjects and academic information
- Add timetable management
- Add expense tracking
- Add campus events and college news
- Add attendance tracking
- Add reminders and notifications
- Add academic progress tracking
- Add navigation between different screens
- Add state management
- Add custom widgets and themes
- Add forms and input validation
- Add animations and transitions
- Add REST API integration
- Improve the user interface
- Add more personalized student features