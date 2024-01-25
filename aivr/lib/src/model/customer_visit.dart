class CustomerVisit {
  String alamat;
  String kota;
  String negara;
  String telpon;
  String email;
  String aplikasi;
  String detailAplikasi;
  String bertemuDengan;
  String pesertaLain;
  String lemSaatIni;
  String konsumsiLem;
  String peggarapLem;

  CustomerVisit({
    required this.alamat,
    required this.kota,
    required this.negara,
    required this.telpon,
    required this.email,
    required this.aplikasi,
    required this.detailAplikasi,
    required this.bertemuDengan,
    required this.pesertaLain,
    required this.lemSaatIni,
    required this.konsumsiLem,
    required this.peggarapLem,
  });
  //TODO: add constructor from json

  @override
  String toString() {
    return 'CustomerVisit(alamat: $alamat, kota: $kota, negara: $negara, telpon: $telpon, email: $email, aplikasi: $aplikasi, detailAplikasi: $detailAplikasi, bertemuDengan: $bertemuDengan, pesertaLain: $pesertaLain, lemSaatIni: $lemSaatIni, konsumsiLem: $konsumsiLem, peggarapLem: $peggarapLem)';
  }
}
