// To parse this JSON data, do
//
//     final dataPengirimanModels = dataPengirimanModelsFromJson(jsonString);

import 'dart:convert';

DataPengirimanModels dataPengirimanModelsFromJson(String str) => DataPengirimanModels.fromJson(json.decode(str));

String dataPengirimanModelsToJson(DataPengirimanModels data) => json.encode(data.toJson());

class DataPengirimanModels {
  DataPengirimanModels({
    this.noOrder,
    this.idOrder,
    this.idTransporter,
    this.idShipper,
    this.tglPengiriman,
    this.statusPengiriman,
    this.tglMuat,
    this.qty,
    this.bobotBarang,
    this.panjangBarang,
    this.lebarBarang,
    this.tinggiBarang,
    this.kategoriBarang,
    this.harga,
    this.namaPengirim,
    this.policeNo,
    this.brand,
    this.picFilePath,
    this.capacity,
    this.jenisKendaraan,
    this.idVehicle,
    this.provAsal,
    this.kabAsal,
    this.provTujuan,
    this.kabTujuan,
    this.idDriver,
    this.status,
  });

  String? noOrder;
  int? idOrder;
  int? idTransporter;
  int? idShipper;
  DateTime? tglPengiriman;
  String? statusPengiriman;
  DateTime? tglMuat;
  dynamic qty;
  dynamic bobotBarang;
  dynamic panjangBarang;
  dynamic lebarBarang;
  dynamic tinggiBarang;
  dynamic kategoriBarang;
  int? harga;
  String? namaPengirim;
  String? policeNo;
  String? brand;
  String? picFilePath;
  int? capacity;
  String? jenisKendaraan;
  int? idVehicle;
  String? provAsal;
  String? kabAsal;
  String? provTujuan;
  String? kabTujuan;
  int? idDriver;
  int? status;

  factory DataPengirimanModels.fromJson(Map<String, dynamic> json) => DataPengirimanModels(
        noOrder: json["no_order"],
        idOrder: json["id_order"],
        idTransporter: json["id_transporter"],
        idShipper: json["id_shipper"],
        tglPengiriman: DateTime.parse(json["tgl_pengiriman"]),
        statusPengiriman: json["status_pengiriman"],
        tglMuat: DateTime.parse(json["tgl_muat"]),
        qty: json["qty"],
        bobotBarang: json["bobot_barang"],
        panjangBarang: json["panjang_barang"],
        lebarBarang: json["lebar_barang"],
        tinggiBarang: json["tinggi_barang"],
        kategoriBarang: json["kategori_barang"],
        harga: json["harga"],
        namaPengirim: json["nama_pengirim"],
        policeNo: json["police_no"],
        brand: json["brand"],
        picFilePath: json["pic_file_path"],
        capacity: json["capacity"],
        jenisKendaraan: json["jenis_kendaraan"],
        idVehicle: json["id_vehicle"],
        provAsal: json["prov_asal"],
        kabAsal: json["kab_asal"],
        provTujuan: json["prov_tujuan"],
        kabTujuan: json["kab_tujuan"],
        idDriver: json["id_driver"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "no_order": noOrder,
        "id_order": idOrder,
        "id_transporter": idTransporter,
        "id_shipper": idShipper,
        "tgl_pengiriman":
            "${tglPengiriman!.year.toString().padLeft(4, '0')}-${tglPengiriman!.month.toString().padLeft(2, '0')}-${tglPengiriman!.day.toString().padLeft(2, '0')}",
        "status_pengiriman": statusPengiriman,
        "tgl_muat":
            "${tglMuat!.year.toString().padLeft(4, '0')}-${tglMuat!.month.toString().padLeft(2, '0')}-${tglMuat!.day.toString().padLeft(2, '0')}",
        "qty": qty,
        "bobot_barang": bobotBarang,
        "panjang_barang": panjangBarang,
        "lebar_barang": lebarBarang,
        "tinggi_barang": tinggiBarang,
        "kategori_barang": kategoriBarang,
        "harga": harga,
        "nama_pengirim": namaPengirim,
        "police_no": policeNo,
        "brand": brand,
        "pic_file_path": picFilePath,
        "capacity": capacity,
        "jenis_kendaraan": jenisKendaraan,
        "id_vehicle": idVehicle,
        "prov_asal": provAsal,
        "kab_asal": kabAsal,
        "prov_tujuan": provTujuan,
        "kab_tujuan": kabTujuan,
        "id_driver": idDriver,
        "status": status,
      };
}
