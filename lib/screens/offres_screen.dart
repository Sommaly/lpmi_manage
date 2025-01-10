import 'package:flutter/material.dart';

class Offre {
  String name;
  String description;
  double salary;

  Offre({required this.name, required this.description, required this.salary});
}

List<Offre> offres = [
  Offre(
    name: 'Développeur web',
    description: 'Développez un site en HTML/CSS',
    salary: 1958,
  ),
  Offre(
    name: 'Développeur mobile',
    description: 'Maintenez une application mobile Flutter',
    salary: 2413,
  ),
  Offre(
    name: 'Développeur front-end',
    description: 'Améliorez le site codé en React',
    salary: 2485,
  ),
];

class OffresScreen extends StatefulWidget {
  @override
  _OffresScreenState createState() => _OffresScreenState();
}

class _OffresScreenState extends State<OffresScreen> {
  List<bool> _expanded = List.generate(offres.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offres'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: offres.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      offres[index].name,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    trailing: Text('Salaire ${offres[index].salary}€/mois'),
                    onTap: () {
                      setState(() {
                        _expanded[index] = !_expanded[index];
                      });
                    },
                  ),
                  // details
                  if (_expanded[index])
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            offres[index].description,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
