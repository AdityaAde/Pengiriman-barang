// To parse this JSON data, do
//
//     final detailPengirimanModels = detailPengirimanModelsFromJson(jsonString);

import 'dart:convert';

DetailPengirimanModels detailPengirimanModelsFromJson(String str) => DetailPengirimanModels.fromJson(json.decode(str));

String detailPengirimanModelsToJson(DetailPengirimanModels data) => json.encode(data.toJson());

class DetailPengirimanModels {
  DetailPengirimanModels({
    this.detail,
    this.pengirim,
    this.penerima,
    this.logStatus,
    this.fotoMuatBarang,
    this.fotoBongkarBarang,
  });

  Detail? detail;
  Pengirim? pengirim;
  List<Penerima>? penerima;
  List<LogStatus>? logStatus;
  List<dynamic>? fotoMuatBarang;
  List<dynamic>? fotoBongkarBarang;

  factory DetailPengirimanModels.fromJson(Map<String, dynamic> json) => DetailPengirimanModels(
        detail: Detail.fromJson(json["detail"]),
        pengirim: Pengirim.fromJson(json["pengirim"]),
        penerima: List<Penerima>.from(json["penerima"].map((x) => Penerima.fromJson(x))),
        logStatus: List<LogStatus>.from(json["log_status"].map((x) => LogStatus.fromJson(x))),
        fotoMuatBarang: List<dynamic>.from(json["foto_muat_barang"].map((x) => x)),
        fotoBongkarBarang: List<dynamic>.from(json["foto_bongkar_barang"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "detail": detail!.toJson(),
        "pengirim": pengirim!.toJson(),
        "penerima": List<dynamic>.from(penerima!.map((x) => x.toJson())),
        "log_status": List<dynamic>.from(logStatus!.map((x) => x.toJson())),
        "foto_muat_barang": List<dynamic>.from(fotoMuatBarang!.map((x) => x)),
        "foto_bongkar_barang": List<dynamic>.from(fotoBongkarBarang!.map((x) => x)),
      };
}

class Detail {
  Detail({
    this.namaPerjanjian,
    this.idOrder,
    this.noOrder,
    this.idTransporter,
    this.idShipper,
    this.idTop,
    this.tglOrder,
    this.tipeSchedule,
    this.status,
    this.dateFrom,
    this.dateTo,
    this.tipeOrder,
    this.tipeLayanan,
    this.tipePengiriman,
    this.namaTransporter,
    this.imageTransporter,
    this.statusPengiriman,
    this.idOrderDetail,
    this.idProdukTransporter,
    this.noSuratJalan,
    this.tglPengiriman,
    this.totalHarga,
    this.harga,
    this.catatan,
    this.biayaLayananShipper,
    this.biayaLayananTransporter,
    this.ppnShipper,
    this.idDriver,
    this.namaDriver,
    this.emailDriver,
    this.nohpDriver,
    this.image,
    this.fotoBuktiFilepath,
    this.biayaBongkar,
    this.biayaInap,
    this.biayaKawalan,
    this.biayaAsuransi,
    this.flagRelease,
    this.fee,
    this.totalHargaToTransporter,
    this.flagInvoice,
    this.idRoute,
    this.est,
    this.kodeRoute,
    this.namaRoute,
    this.provAsal,
    this.kabAsal,
    this.provTujuan,
    this.kabTujuan,
    this.policeNo,
    this.brand,
    this.heigth,
    this.width,
    this.length,
    this.jenisKendaraan,
    this.capacity,
    this.imageTruck,
    this.jmlBayar,
    this.statusPembayaran,
  });

  String? namaPerjanjian;
  int? idOrder;
  String? noOrder;
  int? idTransporter;
  int? idShipper;
  int? idTop;
  DateTime? tglOrder;
  int? tipeSchedule;
  int? status;
  DateTime? dateFrom;
  DateTime? dateTo;
  int? tipeOrder;
  String? tipeLayanan;
  String? tipePengiriman;
  String? namaTransporter;
  dynamic imageTransporter;
  String? statusPengiriman;
  int? idOrderDetail;
  int? idProdukTransporter;
  String? noSuratJalan;
  DateTime? tglPengiriman;
  int? totalHarga;
  int? harga;
  String? catatan;
  int? biayaLayananShipper;
  int? biayaLayananTransporter;
  int? ppnShipper;
  int? idDriver;
  String? namaDriver;
  String? emailDriver;
  String? nohpDriver;
  String? image;
  dynamic fotoBuktiFilepath;
  int? biayaBongkar;
  int? biayaInap;
  int? biayaKawalan;
  int? biayaAsuransi;
  int? flagRelease;
  dynamic fee;
  dynamic totalHargaToTransporter;
  int? flagInvoice;
  int? idRoute;
  int? est;
  String? kodeRoute;
  String? namaRoute;
  String? provAsal;
  String? kabAsal;
  String? provTujuan;
  String? kabTujuan;
  String? policeNo;
  String? brand;
  int? heigth;
  int? width;
  int? length;
  String? jenisKendaraan;
  int? capacity;
  String? imageTruck;
  int? jmlBayar;
  int? statusPembayaran;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        namaPerjanjian: json["nama_perjanjian"],
        idOrder: json["id_order"],
        noOrder: json["no_order"],
        idTransporter: json["id_transporter"],
        idShipper: json["id_shipper"],
        idTop: json["id_top"],
        tglOrder: DateTime.parse(json["tgl_order"]),
        tipeSchedule: json["tipe_schedule"],
        status: json["status"],
        dateFrom: DateTime.parse(json["date_from"]),
        dateTo: DateTime.parse(json["date_to"]),
        tipeOrder: json["tipe_order"],
        tipeLayanan: json["tipe_layanan"],
        tipePengiriman: json["tipe_pengiriman"],
        namaTransporter: json["nama_transporter"],
        imageTransporter: json["image_transporter"],
        statusPengiriman: json["status_pengiriman"],
        idOrderDetail: json["id_order_detail"],
        idProdukTransporter: json["id_produk_transporter"],
        noSuratJalan: json["no_surat_jalan"],
        tglPengiriman: DateTime.parse(json["tgl_pengiriman"]),
        totalHarga: json["total_harga"],
        harga: json["harga"],
        catatan: json["catatan"],
        biayaLayananShipper: json["biaya_layanan_shipper"],
        biayaLayananTransporter: json["biaya_layanan_transporter"],
        ppnShipper: json["ppn_shipper"],
        idDriver: json["id_driver"],
        namaDriver: json["nama_driver"],
        emailDriver: json["email_driver"],
        nohpDriver: json["nohp_driver"],
        image: json["image"],
        fotoBuktiFilepath: json["foto_bukti_filepath"],
        biayaBongkar: json["biaya_bongkar"],
        biayaInap: json["biaya_inap"],
        biayaKawalan: json["biaya_kawalan"],
        biayaAsuransi: json["biaya_asuransi"],
        flagRelease: json["flag_release"],
        fee: json["fee"],
        totalHargaToTransporter: json["total_harga_to_transporter"],
        flagInvoice: json["flag_invoice"],
        idRoute: json["id_route"],
        est: json["est"],
        kodeRoute: json["kode_route"],
        namaRoute: json["nama_route"],
        provAsal: json["prov_asal"],
        kabAsal: json["kab_asal"],
        provTujuan: json["prov_tujuan"],
        kabTujuan: json["kab_tujuan"],
        policeNo: json["police_no"],
        brand: json["brand"],
        heigth: json["heigth"],
        width: json["width"],
        length: json["length"],
        jenisKendaraan: json["jenis_kendaraan"],
        capacity: json["capacity"],
        imageTruck: json["image_truck"],
        jmlBayar: json["jml_bayar"],
        statusPembayaran: json["status_pembayaran"],
      );

  Map<String, dynamic> toJson() => {
        "nama_perjanjian": namaPerjanjian,
        "id_order": idOrder,
        "no_order": noOrder,
        "id_transporter": idTransporter,
        "id_shipper": idShipper,
        "id_top": idTop,
        "tgl_order": tglOrder!.toIso8601String(),
        "tipe_schedule": tipeSchedule,
        "status": status,
        "date_from":
            "${dateFrom!.year.toString().padLeft(4, '0')}-${dateFrom!.month.toString().padLeft(2, '0')}-${dateFrom!.day.toString().padLeft(2, '0')}",
        "date_to":
            "${dateTo!.year.toString().padLeft(4, '0')}-${dateTo!.month.toString().padLeft(2, '0')}-${dateTo!.day.toString().padLeft(2, '0')}",
        "tipe_order": tipeOrder,
        "tipe_layanan": tipeLayanan,
        "tipe_pengiriman": tipePengiriman,
        "nama_transporter": namaTransporter,
        "image_transporter": imageTransporter,
        "status_pengiriman": statusPengiriman,
        "id_order_detail": idOrderDetail,
        "id_produk_transporter": idProdukTransporter,
        "no_surat_jalan": noSuratJalan,
        "tgl_pengiriman": tglPengiriman!.toIso8601String(),
        "total_harga": totalHarga,
        "harga": harga,
        "catatan": catatan,
        "biaya_layanan_shipper": biayaLayananShipper,
        "biaya_layanan_transporter": biayaLayananTransporter,
        "ppn_shipper": ppnShipper,
        "id_driver": idDriver,
        "nama_driver": namaDriver,
        "email_driver": emailDriver,
        "nohp_driver": nohpDriver,
        "image": image,
        "foto_bukti_filepath": fotoBuktiFilepath,
        "biaya_bongkar": biayaBongkar,
        "biaya_inap": biayaInap,
        "biaya_kawalan": biayaKawalan,
        "biaya_asuransi": biayaAsuransi,
        "flag_release": flagRelease,
        "fee": fee,
        "total_harga_to_transporter": totalHargaToTransporter,
        "flag_invoice": flagInvoice,
        "id_route": idRoute,
        "est": est,
        "kode_route": kodeRoute,
        "nama_route": namaRoute,
        "prov_asal": provAsal,
        "kab_asal": kabAsal,
        "prov_tujuan": provTujuan,
        "kab_tujuan": kabTujuan,
        "police_no": policeNo,
        "brand": brand,
        "heigth": heigth,
        "width": width,
        "length": length,
        "jenis_kendaraan": jenisKendaraan,
        "capacity": capacity,
        "image_truck": imageTruck,
        "jml_bayar": jmlBayar,
        "status_pembayaran": statusPembayaran,
      };
}

class LogStatus {
  LogStatus({
    this.namaStatus,
    this.tanggal,
    this.jam,
  });

  String? namaStatus;
  DateTime? tanggal;
  String? jam;

  factory LogStatus.fromJson(Map<String, dynamic> json) => LogStatus(
        namaStatus: json["nama_status"],
        tanggal: DateTime.parse(json["tanggal"]),
        jam: json["jam"],
      );

  Map<String, dynamic> toJson() => {
        "nama_status": namaStatus,
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "jam": jam,
      };
}

class Penerima {
  Penerima({
    this.idPenerima,
    this.idOrder,
    this.idShipper,
    this.namaPenerima,
    this.noHp,
    this.alamat,
    this.prov,
    this.kab,
    this.kec,
    this.kel,
    this.kodePos,
    this.status,
    this.ktpPenerima,
    this.detailBarang,
  });

  int? idPenerima;
  int? idOrder;
  int? idShipper;
  String? namaPenerima;
  String? noHp;
  String? alamat;
  String? prov;
  String? kab;
  String? kec;
  String? kel;
  int? kodePos;
  int? status;
  String? ktpPenerima;
  List<DetailBarang>? detailBarang;

  factory Penerima.fromJson(Map<String, dynamic> json) => Penerima(
        idPenerima: json["id_penerima"],
        idOrder: json["id_order"],
        idShipper: json["id_shipper"],
        namaPenerima: json["nama_penerima"],
        noHp: json["no_hp"],
        alamat: json["alamat"],
        prov: json["prov"],
        kab: json["kab"],
        kec: json["kec"],
        kel: json["kel"],
        kodePos: json["kode_pos"],
        status: json["status"],
        ktpPenerima: json["ktp_penerima"],
        detailBarang: List<DetailBarang>.from(json["detail_barang"].map((x) => DetailBarang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_penerima": idPenerima,
        "id_order": idOrder,
        "id_shipper": idShipper,
        "nama_penerima": namaPenerima,
        "no_hp": noHp,
        "alamat": alamat,
        "prov": prov,
        "kab": kab,
        "kec": kec,
        "kel": kel,
        "kode_pos": kodePos,
        "status": status,
        "ktp_penerima": ktpPenerima,
        "detail_barang": List<dynamic>.from(detailBarang!.map((x) => x.toJson())),
      };
}

class DetailBarang {
  DetailBarang({
    this.id,
    this.jenisBarang,
    this.berat,
    this.bobotBarang,
    this.keterangan,
    this.lebar,
    this.panjang,
    this.tinggi,
    this.nilaiBarang,
    this.qty,
  });

  int? id;
  String? jenisBarang;
  dynamic berat;
  int? bobotBarang;
  String? keterangan;
  int? lebar;
  int? panjang;
  int? tinggi;
  int? nilaiBarang;
  int? qty;

  factory DetailBarang.fromJson(Map<String, dynamic> json) => DetailBarang(
        id: json["id"],
        jenisBarang: json["jenis_barang"],
        berat: json["berat"],
        bobotBarang: json["bobot_barang"],
        keterangan: json["keterangan"],
        lebar: json["lebar"],
        panjang: json["panjang"],
        tinggi: json["tinggi"],
        nilaiBarang: json["nilai_barang"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jenis_barang": jenisBarang,
        "berat": berat,
        "bobot_barang": bobotBarang,
        "keterangan": keterangan,
        "lebar": lebar,
        "panjang": panjang,
        "tinggi": tinggi,
        "nilai_barang": nilaiBarang,
        "qty": qty,
      };
}

class Pengirim {
  Pengirim({
    this.idPickup,
    this.idOrder,
    this.idShipper,
    this.namaPengirim,
    this.noHp,
    this.alamat,
    this.prov,
    this.kab,
    this.kec,
    this.kel,
    this.kodePos,
    this.ktpPengirim,
    this.status,
    this.latPengirim,
    this.longPengirim,
  });

  int? idPickup;
  int? idOrder;
  int? idShipper;
  String? namaPengirim;
  String? noHp;
  String? alamat;
  String? prov;
  String? kab;
  String? kec;
  String? kel;
  int? kodePos;
  String? ktpPengirim;
  int? status;
  dynamic latPengirim;
  dynamic longPengirim;

  factory Pengirim.fromJson(Map<String, dynamic> json) => Pengirim(
        idPickup: json["id_pickup"],
        idOrder: json["id_order"],
        idShipper: json["id_shipper"],
        namaPengirim: json["nama_pengirim"],
        noHp: json["no_hp"],
        alamat: json["alamat"],
        prov: json["prov"],
        kab: json["kab"],
        kec: json["kec"],
        kel: json["kel"],
        kodePos: json["kode_pos"],
        ktpPengirim: json["ktp_pengirim"],
        status: json["status"],
        latPengirim: json["lat_pengirim"],
        longPengirim: json["long_pengirim"],
      );

  Map<String, dynamic> toJson() => {
        "id_pickup": idPickup,
        "id_order": idOrder,
        "id_shipper": idShipper,
        "nama_pengirim": namaPengirim,
        "no_hp": noHp,
        "alamat": alamat,
        "prov": prov,
        "kab": kab,
        "kec": kec,
        "kel": kel,
        "kode_pos": kodePos,
        "ktp_pengirim": ktpPengirim,
        "status": status,
        "lat_pengirim": latPengirim,
        "long_pengirim": longPengirim,
      };
}
