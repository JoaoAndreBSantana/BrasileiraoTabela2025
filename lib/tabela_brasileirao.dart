import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'time.dart';
import 'detalhe_time_page.dart';
import 'artilheiro_page.dart'; // se a lista de artilheiros estiver lá

Future<List<Time>> carregarTimes() async {
  final dados = await rootBundle.loadString('assets/times.json');
  final jsonResult = json.decode(dados);
  return (jsonResult['times'] as List)
      .map((t) => Time.fromJson(t))
      .toList();
}

class TabelaBrasileirao extends StatefulWidget {
  const TabelaBrasileirao({super.key});

  @override
  State<TabelaBrasileirao> createState() => _TabelaBrasileiraoState();
}

class _TabelaBrasileiraoState extends State<TabelaBrasileirao> {
  String filtro = '';
  int abaSelecionada = 0; 
  int tipoEstatistica = 0; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.table_chart,
                    color: abaSelecionada == 0 ? Colors.green : Colors.grey),
                tooltip: 'Tabela',
                onPressed: () {
                  setState(() => abaSelecionada = 0);
                },
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: Icon(Icons.bar_chart,
                    color: abaSelecionada == 1 ? Colors.blue : Colors.grey),
                tooltip: 'Estatísticas',
                onPressed: () {
                  setState(() => abaSelecionada = 1);
                },
              ),
            ],
          ),
        ),
        if (abaSelecionada == 0)
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar time...',
                prefixIcon: const Icon(Icons.search, size: 20),
                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
              ),
              style: const TextStyle(fontSize: 15, color: Colors.black),
              onChanged: (value) {
                setState(() {
                  filtro = value;
                });
              },
            ),
          ),
        if (abaSelecionada == 0)
          
          Expanded(
            child: FutureBuilder<List<Time>>(
              future: carregarTimes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Erro ao carregar dados'));
                }
                var times = snapshot.data!;
                times.sort((a, b) => b.pontos.compareTo(a.pontos));
                var timesFiltrados = filtro.isNotEmpty
                    ? times.where((t) => t.nome.toLowerCase().contains(filtro.toLowerCase())).toList()
                    : times;

                return Column(
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Row(
                        children: [
                          const SizedBox(width: 32, child: Text(' ', style: TextStyle(fontWeight: FontWeight.bold))),
                          const Expanded(
                            child: Center(
                              child: Text(' ', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          _headerStat('P'),
                          _headerStat('J'),
                          _headerStat('V'),
                          _headerStat('E'),
                          _headerStat('D'),
                          _headerStat('GP'),
                          _headerStat('GC'),
                          _headerStat('SG'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: timesFiltrados.isEmpty
                          ? Center(
                              child: Text(
                                'Time não encontrado',
                                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                              ),
                            )
                          : ListView.builder(
                              itemCount: timesFiltrados.length,
                              itemBuilder: (context, index) {
                                final time = timesFiltrados[index];
                                final posicao = times.indexOf(time);
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DetalheTimePage(time: time),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: BorderSide(
                                        color: posicao < 4
                                            ? Colors.green
                                            : (posicao < 12 ? Colors.blue : (posicao > 15 ? Colors.red : Colors.transparent)),
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 32, child: Text('${posicao + 1}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  time.escudo,
                                                  width: 32,
                                                  height: 32,
                                                  errorBuilder: (c, e, s) => const Icon(Icons.sports_soccer),
                                                ),
                                                const SizedBox(width: 4),
                                                if (posicao < 4)
                                                  const Icon(Icons.circle, color: Colors.green, size: 14)
                                                else if (posicao < 12)
                                                  const Icon(Icons.circle, color: Colors.blue, size: 14)
                                                else if (posicao > 15)
                                                  const Icon(Icons.circle, color: Colors.red, size: 14)
                                              ],
                                            ),
                                          ),
                                          _statNum(time.pontos),
                                          _statNum(time.jogos),
                                          _statNum(time.vitorias),
                                          _statNum(time.empates),
                                          _statNum(time.derrotas),
                                          _statNum(time.golsPro),
                                          _statNum(time.golsContra),
                                          _statNum(time.saldoGols),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        if (abaSelecionada == 1)
         
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceChip(
                      label: const Text('Gols'),
                      selected: tipoEstatistica == 0,
                      onSelected: (v) {
                        setState(() => tipoEstatistica = 0);
                      },
                    ),
                    const SizedBox(width: 12),
                    ChoiceChip(
                      label: const Text('Assistências'),
                      selected: tipoEstatistica == 1,
                      onSelected: (v) {
                        setState(() => tipoEstatistica = 1);
                      },
                    ),
                  ],
                ),
              ),
              
              SizedBox(
                height: 400, 
                child: ListView.builder(
                  itemCount: tipoEstatistica == 0
                      ? listaDeArtilheirosGols.length
                      : listaDeArtilheirosAssistencias.length,
                  itemBuilder: (context, index) {
                    final a = tipoEstatistica == 0
                        ? listaDeArtilheirosGols[index]
                        : listaDeArtilheirosAssistencias[index];
                    return ListTile(
                      leading: Image.asset(
                        a.escudoTime,
                        width: 32,
                        height: 32,
                      ),
                      title: Text(a.nome),
                      subtitle: Text(a.time),
                      trailing: tipoEstatistica == 0
                          ? Text('Gols: ${a.gols}')
                          : Text('Assistências: ${a.assistencias}'),
                    );
                  },
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _headerStat(String label) {
    return SizedBox(
      width: 32,
      child: Text(label, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _statNum(int value) {
    return SizedBox(
      width: 32,
      child: Text('$value', textAlign: TextAlign.center, style: const TextStyle(fontSize: 13)),
    );
  }
}