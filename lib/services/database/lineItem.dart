class LineItem {
  late String _description;
  late String _accountName;
  late double _amount;
  late String _transactionDate;
  late String _transactionTime;
  late final String? _UID;

  String get description => _description;
  String get accountName => _accountName;
  double get amount => _amount;
  String get transactionDate => _transactionDate;
  String get transactionTime => _transactionTime;
  String? get UID => _UID;

  LineItem(
      {description, accountName, amount, transactionDate, transactionTime}) {
    _description = description;
    _accountName = accountName;
    _amount = amount;
    _transactionDate = transactionDate;
    _transactionTime = transactionTime;
  }
}
