import 'package:flutter/material.dart';
import 'time.dart';

class DetalheTimePage extends StatelessWidget {
  final Time time;
  const DetalheTimePage({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(time.escudo, width: 32, height: 32, errorBuilder: (c, e, s) => const Icon(Icons.sports_soccer)),
            const SizedBox(width: 12),
            Text(time.nome, style: const TextStyle(color: Colors.black)),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Image.asset(time.escudo, width: 80, height: 80, errorBuilder: (c, e, s) => const Icon(Icons.sports_soccer, size: 80)),
                    const SizedBox(height: 12),
                    Text(
                      time.nome,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    if (time.titulos.isNotEmpty)
                      Column(
                        children: [
                          const Text('Títulos Brasileiros:', style: TextStyle(fontWeight: FontWeight.bold)),
                          Wrap(
                            spacing: 8,
                            children: time.titulos.map((ano) => Chip(label: Text('$ano'))).toList(),
                          ),
                        ],
                      )
                    else
                      const Text('Ainda não possui títulos brasileiros', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Estatísticas da Temporada', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const Divider(),
                    _statItem(Icons.star, 'Pontos', time.pontos),
                    _statItem(Icons.sports_soccer, 'Jogos', time.jogos),
                    _statItem(Icons.emoji_events, 'Vitórias', time.vitorias),
                    _statItem(Icons.handshake, 'Empates', time.empates),
                    _statItem(Icons.cancel, 'Derrotas', time.derrotas),
                    _statItem(Icons.arrow_upward, 'Gols Pró', time.golsPro),
                    _statItem(Icons.arrow_downward, 'Gols Contra', time.golsContra),
                    _statItem(Icons.balance, 'Saldo de Gols', time.saldoGols),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statItem(IconData icon, String label, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueGrey, size: 22),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(fontSize: 16)),
          const Spacer(),
          Text('$value', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}