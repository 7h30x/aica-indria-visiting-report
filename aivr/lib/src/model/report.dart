class Report {
  String? mempunyaiMerkInput;
  String? tanggalKunjunganInput;
  String? namaPerusahaanInput;
  String? alamatInput;
  String? kotaInput;
  String? negaraInput;
  String? kontakInput;
  String? emailInput;
  String? aplikasiInput;
  String? detailAplikasiInput;
  String? bertemuDenganInput;
  String? pesertaLainInput;
  String? lemSaatIniInput;
  String? konsumsiLemInput;
  String? pengarapanLemInput;

  Report({
    this.mempunyaiMerkInput,
    this.tanggalKunjunganInput,
    this.namaPerusahaanInput,
    this.alamatInput,
    this.kotaInput,
    this.negaraInput,
    this.kontakInput,
    this.emailInput,
    this.aplikasiInput,
    this.detailAplikasiInput,
    this.bertemuDenganInput,
    this.pesertaLainInput,
    this.lemSaatIniInput,
    this.konsumsiLemInput,
    this.pengarapanLemInput,
  });

  void updateFields({
    String? mempunyaiMerkInputValidated,
    String? tanggalKunjunganInputValidated,
    String? namaPerusahaanInputValidated,
    String? alamatInputValidated,
    String? kotaInputValidated,
    String? negaraInputValidated,
    String? kontakInputValidated,
    String? emailInputValidated,
    String? aplikasiInputValidated,
    String? detailAplikasiInputValidated,
    String? bertemuDenganInputValidated,
    String? pesertaLainInputValidated,
    String? lemSaatIniInputValidated,
    String? konsumsiLemInputValidated,
    String? pengarapanLemInputValidated,
  }) {
    if (mempunyaiMerkInputValidated != null) {
      mempunyaiMerkInput = mempunyaiMerkInputValidated;
    }
    if (mempunyaiMerkInputValidated != null) {
      mempunyaiMerkInput = mempunyaiMerkInputValidated;
    }
    if (tanggalKunjunganInputValidated != null) {
      tanggalKunjunganInput = tanggalKunjunganInputValidated;
    }
    if (namaPerusahaanInputValidated != null) {
      namaPerusahaanInput = namaPerusahaanInputValidated;
    }
    if (alamatInputValidated != null) {
      alamatInput = alamatInputValidated;
    }
    if (kotaInputValidated != null) {
      kotaInput = kotaInputValidated;
    }
    if (negaraInputValidated != null) {
      negaraInput = negaraInputValidated;
    }
    if (kontakInputValidated != null) {
      kontakInput = kontakInputValidated;
    }
    if (emailInputValidated != null) {
      emailInput = emailInputValidated;
    }
    if (aplikasiInputValidated != null) {
      aplikasiInput = aplikasiInputValidated;
    }
    if (detailAplikasiInputValidated != null) {
      detailAplikasiInput = detailAplikasiInputValidated;
    }
    if (bertemuDenganInputValidated != null) {
      bertemuDenganInput = bertemuDenganInputValidated;
    }
    if (pesertaLainInputValidated != null) {
      pesertaLainInput = pesertaLainInputValidated;
    }
    if (lemSaatIniInputValidated != null) {
      lemSaatIniInput = lemSaatIniInputValidated;
    }
    if (konsumsiLemInputValidated != null) {
      konsumsiLemInput = konsumsiLemInputValidated;
    }
    if (pengarapanLemInputValidated != null) {
      pengarapanLemInput = pengarapanLemInputValidated;
    }
  }

  // Additional methods can be added here, such as toJson, fromJson, etc.
}
