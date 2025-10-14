import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'time.dart';
import 'detalhe_time_page.dart';

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

  Color? getLinhaColor(int pos) {
    if (pos < 4) return Colors.green[100]; // Libertadores
    if (pos < 12) return Colors.blue[100]; // Sul-Americana
    if (pos > 15) return Colors.red[100]; // Rebaixamento
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Time>>(
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
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columnSpacing: 16,
            headingRowHeight: 28,
            dataRowMinHeight: 28,
            dataRowMaxHeight: 32,
            columns: const [
              DataColumn(label: Text(' ', style: TextStyle(fontSize: 11))),
              DataColumn(label: Text(' ', style: TextStyle(fontSize: 11))),
              DataColumn(label: Text('Time', style: TextStyle(fontSize: 11))),
              DataColumn(label: Text('P', style: TextStyle(fontSize: 11))),
              DataColumn(label: Text('J', style: TextStyle(fontSize: 11))),
              DataColumn(label: Text('V', style: TextStyle(fontSize: 11))),
              DataColumn(label: Text('E', style: TextStyle(fontSize: 11))),
              DataColumn(label: Text('D', style: TextStyle(fontSize: 11))),
              DataColumn(label: Text('GP', style: TextStyle(fontSize: 11))),
              DataColumn(label: Text('GC', style: TextStyle(fontSize: 11))),
              DataColumn(label: Text('SG', style: TextStyle(fontSize: 11))),
            ],
            rows: List.generate(times.length, (index) {
              final time = times[index];
              return DataRow(
                color: MaterialStateProperty.all(getLinhaColor(index)),
                cells: [
                  DataCell(Text('${index + 1}', style: const TextStyle(fontSize: 11))),
                  DataCell(
                    Image.asset(
                      time.escudo,
                      width: 16,
                      height: 16,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.sports_soccer, size: 16);
                      },
                    ),
                  ),
                  DataCell(
                    Text(time.nome, style: const TextStyle(fontSize: 11)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetalheTimePage(time: time),
                        ),
                      );
                    },
                  ),
                  DataCell(Text('${time.pontos}', style: const TextStyle(fontSize: 11))),
                  DataCell(Text('${time.jogos}', style: const TextStyle(fontSize: 11))),
                  DataCell(Text('${time.vitorias}', style: const TextStyle(fontSize: 11))),
                  DataCell(Text('${time.empates}', style: const TextStyle(fontSize: 11))),
                  DataCell(Text('${time.derrotas}', style: const TextStyle(fontSize: 11))),
                  DataCell(Text('${time.golsPro}', style: const TextStyle(fontSize: 11))),
                  DataCell(Text('${time.golsContra}', style: const TextStyle(fontSize: 11))),
                  DataCell(Text('${time.saldoGols}', style: const TextStyle(fontSize: 11))),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}