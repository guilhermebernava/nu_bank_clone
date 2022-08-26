class UserAccount {
  final String agency;
  final String bank;
  final String account;
  double balance;
  double saveBalance;

  UserAccount({
    required this.account,
    required this.agency,
    required this.balance,
    required this.bank,
    required this.saveBalance,
  });
}
