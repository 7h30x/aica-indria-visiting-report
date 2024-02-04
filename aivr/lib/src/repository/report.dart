class ReportRepository {
  // Save new report
  void saveNewReport() {
    // Implementation goes here
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

  Future<List<String>> loadDropdownOptionsAplikasi() async {
    await Future.delayed(Duration(seconds: 1));
    return ['Solid Wood', 'Hotmelt'];
  }
}
