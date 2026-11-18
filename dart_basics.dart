// Student: Ahmed Mohamed Saad
// Reg no:  25605
const String regNo = '25605';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by AMS
  final lowerText = text.toLowerCase();
  int count = 0;
  int i = 0;
  while (i < lowerText.length) {
    if ('aeiou'.contains(lowerText[i])) count++;
    i++;
  }
  return count;
}

String initials(String fullName) {
  // by AMS
  final trimmed = fullName.trim();
  if (trimmed.isEmpty) return '';
  final names = trimmed.split(RegExp(r'\s+'));
  final result = StringBuffer();
  int i = 0;
  while (i < names.length) {
    result.write('${names[i][0].toUpperCase()}.');
    i++;
  }
  return result.toString();
}

void drawTriangle(int height) {
  // by AMS
  int row = 1;
  while (row <= height) {
    final line = StringBuffer();
    int spaces = height - row;
    while (spaces > 0) {
      line.write(' ');
      spaces--;
    }
    int symbols = 1;
    final symbol = row.isOdd ? '*' : '#';
    while (symbols <= row) {
      line.write(symbol);
      symbols++;
    }
    print(line.toString());
    row++;
  }
}

int momoFee(int amount) {
  // by AMS
  // This function chooses the correct fee based on the transfer
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String maskPhone(String phone) {
  // by AMS
  if (phone.length != 10) return 'INVALID';
  return '${phone.substring(0, 3)}${'*' * (phone.length - 5)}${phone.substring(phone.length - 2)}';
}

void main() {
  // by AMS
  print('Reg no: $regNo | D = $d | T = $t');
  const name = 'Ahmed Mohamed Saad';
  print('$name has ${countVowels(name)} vowels');
  print(initials(name));
  print(initials(' ana uwase '));
  print(initials(' '));
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  const phone = '0788123456';
  int i = 1;
  int totalFees = 0;
  while (i <= d + 3) {
    final amount = i * 4000 + t * 100;
    final fee = momoFee(amount);
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    if (fee > 0) totalFees += fee;
    i++;
  }
  print('Total fees: $totalFees RWF');
}

// Part G first draft kept as a comment: split(' ') leaves empty pieces for extra spaces.
// String initialsFirstDraft(String fullName) {
//   // by AMS
//   final words = fullName.split(' ');
//   final result = StringBuffer();
//   int i = 0;
//   while (i < words.length) {
//     result.write('${words[i][0].toUpperCase()}.');
//     i++;
//   }
//   return result.toString();
// }
