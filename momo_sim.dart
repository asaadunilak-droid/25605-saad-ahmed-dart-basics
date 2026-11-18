// Student: Ahmed Mohamed Saad
// Reg no:  25605
const String regNo = '25605';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

String formatRwf(int amount) {
  // by AMS
  final negative = amount < 0;
  final digits = amount.abs().toString();
  final result = StringBuffer();
  int i = 0;
  while (i < digits.length) {
    if (i > 0 && (digits.length - i) % 3 == 0) result.write(',');
    result.write(digits[i]);
    i++;
  }
  return '${negative ? '-' : ''}${result.toString()} RWF';
}

int momoFee(int amount) {
  // by AMS
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

bool isValidPin(String pin) {
  // by AMS
  if (pin.length != 5 || pin == '12345') return false;
  int i = 0;
  bool allSame = true;
  while (i < pin.length) {
    final digit = pin.codeUnitAt(i);
    if (digit < 48 || digit > 57) return false;
    if (i > 0 && pin[i] != pin[0]) allSame = false;
    i++;
  }
  return !allSame;
}

int sendMoney(int balance, int amount) {
  // by AMS
  final fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  final newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by AMS
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  final newBalance = balance - amount;
  print('Airtime ${formatRwf(amount)} bought. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  // by AMS
  // This function chooses the correct fee based on the transfer amount.
  print('Reg no: $regNo | D = $d | T = $t');
  print("isValidPin('12345'): ${isValidPin('12345')}");
  print("isValidPin('77777'): ${isValidPin('77777')}");
  print("isValidPin('4821'): ${isValidPin('4821')}");
  print("isValidPin('48a21'): ${isValidPin('48a21')}");
  print("isValidPin('4821$d'): ${isValidPin('4821$d')}");

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');
  int sends = 0;
  while (sends < 3) {
    balance = sendMoney(balance, (d + 1) * 3000);
    sends++;
  }
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);
  print('Final balance: ${formatRwf(balance)}');

  print(formatRwf(0)); // expected: 0 RWF
  print(formatRwf(999)); // expected: 999 RWF
  print(formatRwf(1000)); // expected: 1,000 RWF
  print(formatRwf(1250000)); // expected: 1,250,000 RWF
  print(formatRwf(-5000)); // expected: -5,000 RWF
  print(isValidPin('48215')); // expected: true
  print(isValidPin('77777')); // expected: false; repeated digit case
}
