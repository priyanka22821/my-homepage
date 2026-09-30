import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// MyApp is stateful so we can switch between light and dark mode
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
      home: HomePage(
        isDark: isDark,
        onToggleTheme: () {
          setState(() {
            isDark = !isDark;
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const HomePage({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  final List<String> skills = const [
    'Flutter',
    'Dart',
    'Python',
    'HTML',
    'CSS',
    'Git',
  ];

  final List<Map<String, dynamic>> projects = const [
    {'title': 'Todo App', 'icon': Icons.checklist, 'color': Colors.orange},
    {'title': 'Weather App', 'icon': Icons.cloud, 'color': Colors.blue},
    {'title': 'Chat App', 'icon': Icons.chat, 'color': Colors.green},
    {'title': 'Quiz App', 'icon': Icons.quiz, 'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        actions: [
          IconButton(
            tooltip: 'Toggle dark mode',
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile section
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 55,
                    child: Icon(Icons.person, size: 60),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Your Name',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Computer Science Student',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'I love building apps and learning new technologies.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Skills section
            const Text(
              'Skills',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final skill in skills) Chip(label: Text(skill)),
              ],
            ),
            const SizedBox(height: 28),

            // Projects section
            const Text(
              'Projects',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                for (final p in projects)
                  Card(
                    elevation: 3,
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${p['title']} opened')),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(p['icon'], size: 50, color: p['color']),
                          const SizedBox(height: 10),
                          Text(
                            p['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 28),

            // Contact section
            const Text(
              'Contact Me',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text('yourname@email.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('+880 1XXXXXXXXX'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Sylhet, Bangladesh'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
