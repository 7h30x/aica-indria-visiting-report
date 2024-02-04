import 'package:aivr/src/model/report.dart';
import 'package:aivr/src/repository/report.dart';

import 'package:flutter/material.dart';

class LaporanBaruViewModel extends ChangeNotifier {
  Report userInputReport = Report();
  ReportRepository repo = ReportRepository();
  LaporanBaruViewModel() {
    getDropdownOptionsAplikasi();
  }
  List<DropdownMenuEntry> aplikasiItems = [];
  // save input from user form, to persist state beyond tabbed input page widget lifecycle.
  void saveUserInput({String? mempunyaiMerkInput, String? aplikasi}) {
    userInputReport.updateFields(
        mempunyaiMerkInputValidated: mempunyaiMerkInput,
        aplikasiInputValidated: aplikasi);
    debugPrint('updated user input ');
    debugPrint(userInputReport.aplikasiInput);
  }

  // Load existing report
  void loadExistingReport() {
    // Implementation goes here
  }

  // Load report headers
  void loadReportHeaders() {
    // Implementation goes here
  }

  // Approve existing report
  void approveExistingReport() {
    // Implementation goes here
  }
  Future<List<DropdownMenuEntry>> getDropdownOptionsAplikasi() async {
    List<String> items = await repo.loadDropdownOptionsAplikasi();
    List<DropdownMenuEntry> menuItems =
        items.map((i) => DropdownMenuEntry(value: Text(i), label: i)).toList();
    aplikasiItems = menuItems;
    notifyListeners();
    debugPrint('loaded dropdownOptions Aplikasi');
    debugPrint(aplikasiItems.toString());
    return menuItems;
  }
}
