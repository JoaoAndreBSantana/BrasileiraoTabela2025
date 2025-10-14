import 'package:flutter/material.dart';
import 'time.dart';

class DetalheTimePage extends StatelessWidget {
  final Time time;
  const DetalheTimePage({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(time.nome)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(time.escudo, width: 80, height: 80),
            const SizedBox(height: 16),
            Text('Títulos Brasileiros: ${time.titulos.join(', ')}'),
            const SizedBox(height: 16),
            Text('Pontos: ${time.pontos}'),
            Text('Jogos: ${time.jogos}'),
            Text('Vitórias: ${time.vitorias}'),
            Text('Empates: ${time.empates}'),
            Text('Derrotas: ${time.derrotas}'),
            Text('Gols Pró: ${time.golsPro}'),
            Text('Gols Contra: ${time.golsContra}'),
            Text('Saldo de Gols: ${time.saldoGols}'),
          ],
        ),
      ),
    );
  }
}