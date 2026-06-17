import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/water_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WaterProvider>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("기록"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: provider.clearRecords,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "${provider.totalWater}mL",
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xff4a90e2),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: provider.records.isEmpty
                  ? const Center(
                      child: Text("기록이 없습니다"),
                    )
                  : ListView.builder(
                      itemCount: provider.records.length,
                      itemBuilder: (context, index) {
                        final record = provider.records[index];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          color: Color(0xffE6F2FF),
                          child: ListTile(
                            leading: const Icon(
                              Icons.local_drink,
                              color: Color(0xff4a90e2),
                            ),
                            title: Text(
                              "${record.amount}mL",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              TimeOfDay.fromDateTime(
                                record.time,
                              ).format(context),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                provider.deleteRecord(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}