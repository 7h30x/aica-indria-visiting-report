import "package:aivr/src/model/customer_visit.dart";
import "package:aivr/src/enum/report_status.dart";

class Report {
  String pembuatLaporan; // user id of report creator
  ReportStatus status = ReportStatus.draft;

  // Detail Pertemuan
  String? nomorDokumen;
  String tanggalPertemuan;
  String personInCharge;
  CustomerVisit detailPertemuan;

  // Isi Pertemuan
  String tujuanPertemuan;
  String hasilKunjungan;
  String rencanaTidakLanjut;

  // Autorisasi
  String mengetahui;
  String menyetujui;
  bool deklarasiPenulisLaporan = false;

  Report({
    required this.pembuatLaporan,
    this.nomorDokumen,
    required this.tanggalPertemuan,
    required this.personInCharge,
    required this.detailPertemuan,
    required this.tujuanPertemuan,
    required this.hasilKunjungan,
    required this.rencanaTidakLanjut,
    required this.mengetahui,
    required this.menyetujui,
    this.deklarasiPenulisLaporan = false,
  });

  // Method to update report information
  void updateDetails({
    String? nomorDokumen,
    String? tanggalPertemuan,
    String? personInCharge,
    CustomerVisit? detailPertemuan,
    String? tujuanPertemuan,
    String? hasilKunjungan,
    String? rencanaTidakLanjut,

    //autorisasi
    //TODO: add tanggal approval
    String? mengetahui,
    String? menyetujui,
    bool? deklarasiPenulisLaporan,
  }) {
    if (nomorDokumen != null) this.nomorDokumen = nomorDokumen;
    if (tanggalPertemuan != null) this.tanggalPertemuan = tanggalPertemuan;
    if (personInCharge != null) this.personInCharge = personInCharge;
    if (detailPertemuan != null) this.detailPertemuan = detailPertemuan;
    if (tujuanPertemuan != null) this.tujuanPertemuan = tujuanPertemuan;
    if (hasilKunjungan != null) this.hasilKunjungan = hasilKunjungan;
    if (rencanaTidakLanjut != null)
      this.rencanaTidakLanjut = rencanaTidakLanjut;
    if (mengetahui != null) this.mengetahui = mengetahui;
    if (menyetujui != null) this.menyetujui = menyetujui;
    if (deklarasiPenulisLaporan != null)
      this.deklarasiPenulisLaporan = deklarasiPenulisLaporan;
  }

  // Method to display report information
  String get reportInfo =>
      'ID: $pembuatLaporan, Nomor Dokumen: $nomorDokumen, Tanggal Pertemuan: $tanggalPertemuan, personInCharge: $personInCharge, Tujuan Pertemuan: $tujuanPertemuan, Hasil Kunjungan: $hasilKunjungan, Rencana Tidak Lanjut: $rencanaTidakLanjut, Mengetahui: $mengetahui, Menyetujui: $menyetujui, Deklarasi Penulis Laporan: $deklarasiPenulisLaporan';

  // Additional methods can be added here, such as toJson, fromJson, etc.
}
