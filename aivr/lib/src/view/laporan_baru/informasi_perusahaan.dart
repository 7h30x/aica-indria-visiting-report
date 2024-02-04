import 'package:aivr/src/view_model/report.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class InformasiPerusahaan extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  const InformasiPerusahaan({super.key, required this.formkey});

  @override
  State<InformasiPerusahaan> createState() => _InformasiPerusahaanState();
}

class _InformasiPerusahaanState extends State<InformasiPerusahaan> {
  String _tanggalKunjunganInput = '';
  String _tanggalKunjunganLabel = 'Tanggal Kunjungan';
  String _tanggalKunjunganHint = ' . . . ';
  String _tanggalKunjunganTooltip = ' . . . ';

  String _namaPerusahaanInput = '';
  String _namaPerusahaanLabel = 'Nama Perusahaan';
  String _namaPerusahaanHint = ' . . . ';
  String _namaPerusahaanTooltip = ' . . . ';

  String _mempunyaiMerkInput = '';
  String _mempunyaiMerkLabel = 'Mempunyai Merk';
  String _mempunyaiMerkHint = ' . . . ';
  String _mempunyaiMerkTooltip = ' . . . ';

  String _alamatInput = '';
  String _alamatLabel = 'Alamat';
  String _alamatHint = ' . . . ';
  String _alamatTooltip = ' . . . ';

  String _kotaInput = '';
  String _kotaLabel = 'Kota';
  String _kotaHint = '';
  String _kotaTooltip = ' . . . ';

  String _negaraInput = '';
  String _negaraLabel = 'Negara';
  String _negaraHint = ' . . . ';
  String _negaraTooltip = ' . . . ';

  String _kontakInput = '';
  String _kontakLabel = 'Telfon/Fax/HP';
  String _kontakHint = ' . . . ';
  String _kontakTooltip = ' . . . ';

  String _emailInput = '';
  String _emailLabel = 'Email';
  String _emailHint = ' . . . ';
  String _emailTooltip = ' . . . ';

  String? _aplikasiValue = null;
  String _aplikasiLabel = 'Aplikasi';
  String _aplikasiHint = ' . . . ';
  String _aplikasiTooltip = ' . . . ';

  String _detailAplikasiInput = '';
  String _detailAplikasiLabel = 'Detail Aplikasi';
  String _detailAplikasiHint = ' . . . ';
  String _detailAplikasiTooltip = ' . . . ';

  String _bertemuDenganInput = '';
  String _bertemuDenganLabel = 'Bertemu Dengan';
  String _bertemuDenganHint = ' . . . ';
  String _bertemuDenganTooltip = ' . . . ';

  String _pesertaLainInput = '';
  String _pesertaLainLabel = 'Peserta Lain';
  String _pesertaLainHint = ' . . . ';
  String _pesertaLainTooltip = ' . . . ';

  String _lemSaatIniInput = '';
  String _lemSaatIniLabel = 'Lem Saat Ini';
  String _lemSaatIniHint = ' . . . ';
  String _lemSaatIniTooltip = ' . . . ';

  String _konsumsiLemInput = '';
  String _konsumsiLemLabel = 'Konsumsi Lem';
  String _konsumsiLemHint = ' . . . ';
  String _konsumsiLemTooltip = ' . . . ';

  String _pengarapanLemInput = '';
  String _pengarapanLemLabel = 'Penggarapan Lem';
  String _pengarapanLemHint = ' . . . ';
  String _pengarapanLemTooltip = ' . . . ';

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    assert(args.value is DateTime);
    setState(() {
      _tanggalKunjunganInput = args.value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TabController tabController = DefaultTabController.of(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0), // Optional: Adds padding around the form
      child: Form(
          // Assumin`g you have a GlobalKey<FormState> _formKey for form validation
          key: widget.formkey,
          child: Consumer<LaporanBaruViewModel>(builder: (context, vm, child) {
            // vm.getDropdownOptionsAplikasi();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // children: _fieldNamesToWidgetMap.values.toList(),
              children: [
                Container(child: Text(_tanggalKunjunganLabel)),
                SfDateRangePicker(
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.single,
                  minDate: DateTime.now().subtract(Duration(days: 365)),
                  maxDate: DateTime.now(),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    labelText: _mempunyaiMerkLabel,
                    hintText: _mempunyaiMerkHint,
                    suffixIcon: Tooltip(
                      message: _mempunyaiMerkTooltip, // Tooltip text
                      child: Icon(
                          Icons.info_outline), // Icon to show for the tooltip
                    ),
                  ),
                  controller: TextEditingController(
                      text: vm.userInputReport.mempunyaiMerkInput ??
                          _mempunyaiMerkInput),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    labelText: _alamatLabel,
                    hintText: _alamatHint,
                    suffixIcon: Tooltip(
                      message: _alamatTooltip, // Tooltip text
                      child: Icon(
                          Icons.info_outline), // Icon to show for the tooltip
                    ),
                  ),
                  controller: TextEditingController(
                      text: vm.userInputReport.alamatInput ?? _alamatInput),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    labelText: _kotaLabel,
                    hintText: _kotaHint,
                    suffixIcon: Tooltip(
                      message: _kotaTooltip, // Tooltip text
                      child: Icon(
                          Icons.info_outline), // Icon to show for the tooltip
                    ),
                  ),
                  controller: TextEditingController(
                      text: vm.userInputReport.kotaInput ?? _kotaInput),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    labelText: _negaraLabel,
                    hintText: _negaraHint,
                    suffixIcon: Tooltip(
                      message: _negaraTooltip, // Tooltip text
                      child: Icon(
                          Icons.info_outline), // Icon to show for the tooltip
                    ),
                  ),
                  controller: TextEditingController(
                      text: vm.userInputReport.negaraInput ?? _negaraInput),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    labelText: _kontakLabel,
                    hintText: _kontakHint,
                    suffixIcon: Tooltip(
                      message: _kontakTooltip, // Tooltip text
                      child: Icon(
                          Icons.info_outline), // Icon to show for the tooltip
                    ),
                  ),
                  controller: TextEditingController(
                      text: vm.userInputReport.kontakInput ?? _kontakInput),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    labelText: _emailLabel,
                    hintText: _emailHint,
                    suffixIcon: Tooltip(
                      message: _emailTooltip, // Tooltip text
                      child: Icon(
                          Icons.info_outline), // Icon to show for the tooltip
                    ),
                  ),
                  controller: TextEditingController(
                      text: vm.userInputReport.emailInput ?? _emailInput),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 5.0),
                  child: DropdownMenu(
                      //https://api.flutter.dev/flutter/material/DropdownMenu-class.html
                      hintText: _aplikasiHint,
                      controller: TextEditingController(
                          text: vm.userInputReport.aplikasiInput ?? '-'),
                      requestFocusOnTap: true,
                      label: Text(_aplikasiLabel),
                      onSelected: (value) {
                        // ToDO: validate

                        vm.saveUserInput(aplikasi: value.data);
                      },
                      dropdownMenuEntries: vm.aplikasiItems),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    labelText: _detailAplikasiLabel,
                    hintText: _detailAplikasiHint,
                    suffixIcon: Tooltip(
                      message: _detailAplikasiTooltip, // Tooltip text
                      child: Icon(
                          Icons.info_outline), // Icon to show for the tooltip
                    ),
                  ),
                  controller: TextEditingController(
                      text: vm.userInputReport.detailAplikasiInput ??
                          _detailAplikasiInput),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    labelText: _bertemuDenganLabel,
                    hintText: _bertemuDenganHint,
                    suffixIcon: Tooltip(
                      message: _bertemuDenganTooltip, // Tooltip text
                      child: Icon(
                          Icons.info_outline), // Icon to show for the tooltip
                    ),
                  ),
                  controller: TextEditingController(
                      text: vm.userInputReport.bertemuDenganInput ??
                          _bertemuDenganInput),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    labelText: _pesertaLainLabel,
                    hintText: _pesertaLainHint,
                    suffixIcon: Tooltip(
                      message: _pesertaLainTooltip, // Tooltip text
                      child: Icon(
                          Icons.info_outline), // Icon to show for the tooltip
                    ),
                  ),
                  controller: TextEditingController(
                      text: vm.userInputReport.pesertaLainInput ??
                          _pesertaLainInput),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    labelText: _lemSaatIniLabel,
                    hintText: _lemSaatIniHint,
                    suffixIcon: Tooltip(
                      message: _lemSaatIniTooltip, // Tooltip text
                      child: Icon(
                          Icons.info_outline), // Icon to show for the tooltip
                    ),
                  ),
                  controller: TextEditingController(
                      text: vm.userInputReport.lemSaatIniInput ??
                          _lemSaatIniInput),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    labelText: _konsumsiLemLabel,
                    hintText: _konsumsiLemHint,
                    suffixIcon: Tooltip(
                      message: _konsumsiLemTooltip, // Tooltip text
                      child: Icon(
                          Icons.info_outline), // Icon to show for the tooltip
                    ),
                  ),
                  controller: TextEditingController(
                      text: vm.userInputReport.konsumsiLemInput ??
                          _konsumsiLemInput),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    labelText: _pengarapanLemLabel,
                    hintText: _pengarapanLemHint,
                    suffixIcon: Tooltip(
                      message: _pengarapanLemTooltip, // Tooltip text
                      child: Icon(
                          Icons.info_outline), // Icon to show for the tooltip
                    ),
                  ),
                  controller: TextEditingController(
                      text: vm.userInputReport.pengarapanLemInput ??
                          _pengarapanLemInput),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (widget.formkey.currentState!.validate()) {
                      // Handle form submission
                      vm.saveUserInput(mempunyaiMerkInput: _mempunyaiMerkInput);
                      // save input data to viewmodel

                      // switch to next tab
                      tabController.animateTo(1);
                    }
                  },
                  child: Text('Next'),
                ),
              ],
            );
          })),
    );
  }
}

// 'Nama Perusahaan',
// ,
// 'Alamat',
// 'Kota',
// 'Negara',
// 'Telfon/Fax/HP',
// 'Aplikasi',
// 'Detail Aplikasi',
// 'Bertemu Dengan',
// 'Peserta Lain',
// 'Lem Saat Ini',
// 'Konsumsi Lem',
// 'Pengarap Lem'
