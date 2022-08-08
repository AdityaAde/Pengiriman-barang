import 'package:big/models/data_pengiriman_models.dart';
import 'package:big/provider/authentication.dart';
import 'package:big/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  final String token;
  const HomeScreen({Key? key, required this.token}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DataPengirimanModels dataPengirimanModels;
  final Authentication authentication = Authentication();
  final List<DataPengirimanModels> dataListPengiriman = [];

  @override
  void initState() {
    super.initState();
    authentication.dataPengiriman(widget.token).then((value) {
      setState(() {
        dataListPengiriman.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text('Pengiriman'),
      ),
      body: ListView.builder(
          itemCount: dataListPengiriman.length,
          itemBuilder: (context, index) {
            final dataPengiriman = dataListPengiriman[index];
            String waktuPengiriman = DateFormat('dd/MM/yyyy').format(dataPengiriman.tglPengiriman!);
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      height: 180,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(radius: 8, backgroundColor: Colors.blue),
                                  const SizedBox(width: 5),
                                  Text(dataPengiriman.kabAsal!),
                                ],
                              ),
                              const Text('-', style: TextStyle(fontWeight: FontWeight.w500)),
                              Row(
                                children: [
                                  const CircleAvatar(radius: 8, backgroundColor: Colors.yellow),
                                  const SizedBox(width: 5),
                                  Text(dataPengiriman.kabTujuan!),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text("Status: "),
                              const SizedBox(width: 5),
                              Text(dataPengiriman.statusPengiriman!, style: const TextStyle(color: Colors.blue)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text("Tanggal Pengiriman: "),
                              const SizedBox(width: 5),
                              Text(waktuPengiriman),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text("Jenis Truck: "),
                              const SizedBox(width: 5),
                              Text(dataPengiriman.jenisKendaraan!),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors.orange, fixedSize: const Size(170, 25)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      token: widget.token,
                                      idOrder: dataPengiriman.idOrder!,
                                      asal: dataPengiriman.kabAsal!,
                                      tujuan: dataPengiriman.kabTujuan!,
                                    ),
                                  ),
                                );
                              },
                              child: const Text('Detail'),
                            ),
                          )
                        ],
                      )),
                ),
              ),
            );
          }),
    );
  }
}
