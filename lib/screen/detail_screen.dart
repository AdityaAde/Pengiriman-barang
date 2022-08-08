import 'package:big/models/detail_pengiriman_models.dart';
import 'package:big/provider/authentication.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.token,
    required this.idOrder,
    required this.asal,
    required this.tujuan,
  }) : super(key: key);

  final String token;
  final int idOrder;
  final String asal;
  final String tujuan;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Authentication authentication = Authentication();
  DetailPengirimanModels? detailPengiriman;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Pesanan',
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: authentication.detailPengiriman(widget.token, widget.idOrder),
        builder: (BuildContext context, AsyncSnapshot<DetailPengirimanModels> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 50),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('#${snapshot.data!.detail!.noOrder}'),
                              Row(
                                children: [
                                  const CircleAvatar(radius: 5, backgroundColor: Colors.blue),
                                  const SizedBox(width: 5),
                                  Text(widget.asal)
                                ],
                              ),
                              Row(
                                children: [
                                  const CircleAvatar(radius: 5, backgroundColor: Colors.orange),
                                  const SizedBox(width: 5),
                                  Text(widget.tujuan),
                                ],
                              ),
                              const Text('Tanggal Pengiriman :'),
                              Text(
                                DateFormat('dd-MM-yyyy').format(snapshot.data!.detail!.tglPengiriman!),
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              const Text('Cash in Advance', style: TextStyle(color: Colors.blue)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(height: 30, color: Colors.black.withOpacity(0.1)),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Text('Jenis Kendaraan', style: TextStyle(fontSize: 12.0)),
                                const SizedBox(height: 5),
                                Text(snapshot.data!.detail!.jenisKendaraan!, style: const TextStyle(fontSize: 12.0)),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('Muatan', style: TextStyle(fontSize: 12.0)),
                                SizedBox(height: 5),
                                Text('15 Ton', style: TextStyle(fontSize: 12.0)),
                              ],
                            ),
                            Column(
                              children: [
                                const Text('Tipe Pengaman', style: TextStyle(fontSize: 12.0)),
                                const SizedBox(height: 5),
                                Text(snapshot.data!.detail!.tipeLayanan!, style: const TextStyle(fontSize: 12.0)),
                              ],
                            ),
                            Column(
                              children: [
                                const Text('Status', style: TextStyle(fontSize: 12.0)),
                                const SizedBox(height: 5),
                                Text(
                                  snapshot.data!.detail!.statusPengiriman!,
                                  style: const TextStyle(color: Colors.blue, fontSize: 12.0),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.1),
                        child: const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Alamat Pengirim',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(snapshot.data!.pengirim!.alamat!),
                      Text('Nama: ${snapshot.data!.pengirim!.namaPengirim!}'),
                      Text('Kontak: ${snapshot.data!.pengirim!.noHp!}'),
                      const SizedBox(height: 15),
                      const SizedBox(height: 15),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.penerima!.length,
                          itemBuilder: ((context, index) {
                            final penerima = snapshot.data!.penerima![index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 30,
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  width: double.infinity,
                                  color: Colors.black.withOpacity(0.1),
                                  child: const Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Alamat Penerima',
                                      style: TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(penerima.alamat!),
                                Text('Nama: ${penerima.namaPenerima}'),
                                Text('Kontak: ${penerima.noHp}'),
                                const SizedBox(height: 15),
                                Container(
                                  height: 30,
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  width: double.infinity,
                                  color: Colors.black.withOpacity(0.1),
                                  child: const Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Detail Barang',
                                      style: TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: penerima.detailBarang!.length,
                                    itemBuilder: (context, index) {
                                      final detailBarang = penerima.detailBarang![index];
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Kategori: ${detailBarang.jenisBarang}'),
                                              Text('Lebar (cm/pcs): ${detailBarang.lebar}'),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Jumlah: ${detailBarang.qty}'),
                                              Text('Tinggi (cm): ${detailBarang.tinggi}'),
                                            ],
                                          ),
                                          Text('Bobot (Kg/pcs) : ${detailBarang.bobotBarang}'),
                                          Text('Panjang (Cm/pcs) : ${detailBarang.panjang}'),
                                          const SizedBox(height: 15),
                                        ],
                                      );
                                    })
                              ],
                            );
                          })),
                      const SizedBox(height: 15),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.1),
                        child: const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Pengemudi',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.blue,
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data!.detail!.namaDriver!),
                              Text(snapshot.data!.detail!.emailDriver!),
                              Text(snapshot.data!.detail!.nohpDriver!),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 170,
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.1),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Catatan'),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                color: Colors.white,
                                height: 80,
                                width: double.infinity,
                                child: Text(snapshot.data!.detail!.catatan!),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Tarif Pengiriman'),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Lihat Surah Jalan'),
                          ),
                        ],
                      ),
                      Text(
                        ("Rp.${snapshot.data!.detail!.totalHarga!}"),
                        style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
