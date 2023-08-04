import 'package:bus_ticket_app/presentation/widgets/home/nfc_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final name = 'home_screen';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const NfcWidget(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.menu),
        onPressed: (){},
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
            backgroundColor: colors.primary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outlined),
            label: 'Perfil',
            backgroundColor: colors.primary,
          ),
      ]),
    );
  }
}