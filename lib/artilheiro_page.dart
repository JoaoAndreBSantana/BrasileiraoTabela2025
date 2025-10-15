import 'package:flutter/material.dart';

class ArtilheirosPage extends StatelessWidget {
  final List<Artilheiro> artilheiros;

  const ArtilheirosPage({super.key, required this.artilheiros});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Artilheiros do Brasileirão')),
      body: ListView.builder(
        itemCount: artilheiros.length,
        itemBuilder: (context, index) {
          final a = artilheiros[index];
          return ListTile(
            leading: Image.asset(
              a.escudoTime,
              width: 32,
              height: 32,
              errorBuilder: (c, e, s) => const Icon(Icons.sports_soccer),
            ),
            title: Text(a.nome),
            subtitle: Text(a.time),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Gols: ${a.gols}'),
                Text('Assists: ${a.assistencias}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Artilheiro {
  final String nome;
  final String time;
  final int gols;
  final int assistencias;
  final String foto;
  final String escudoTime; 

  Artilheiro({
    required this.nome,
    required this.time,
    required this.gols,
    required this.assistencias,
    required this.foto,
    required this.escudoTime,
  });
}

final List<Artilheiro> listaDeArtilheirosGols = [
  Artilheiro(nome: 'Kaio Jorge', time: 'Cruzeiro', gols: 15, assistencias: 5, foto: '', escudoTime: 'assets/images/cruzeiro.png'),

  Artilheiro(nome: 'Giorgian De Arrascaeta', time: 'Flamengo', gols: 14, assistencias: 10, foto: '', escudoTime: 'assets/images/flamengo.png'),

  Artilheiro(nome: 'Pablo Vegetti', time: 'Vasco Gama', gols: 12, assistencias: 0, foto: '', escudoTime: 'assets/images/vasco.png'),

  Artilheiro(nome: 'Pedro', time: 'Flamengo', gols: 10, assistencias: 0, foto: '', escudoTime: 'assets/images/flamengo.png'),

  Artilheiro(nome: 'Vitor Ferreira', time: 'Palmeiras SP', gols: 10, assistencias: 0, foto: '', escudoTime: 'assets/images/palmeiras.png'),
 
];

final List<Artilheiro> listaDeArtilheirosAssistencias = [
   Artilheiro(nome: 'Giorgian De Arrascaeta', time: 'Flamengo', gols: 14, assistencias: 10, foto: '', escudoTime: 'assets/images/flamengo.png'),

  Artilheiro(nome: 'Lucas Piton', time: 'Vasco Gama', gols: 0, assistencias: 6, foto: '', escudoTime: 'assets/images/vasco.png'),

  Artilheiro(nome: 'Maurício', time: 'Palmeiras SP', gols: 0, assistencias: 6, foto: '', escudoTime: 'assets/images/palmeiras.png'),

  Artilheiro(nome: 'Nuno Moreira', time: 'Vasco da Gama', gols: 0, assistencias: 5, foto: '', escudoTime: 'assets/images/vasco.png'),
];