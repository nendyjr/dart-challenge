void main() {
  final input = '93223339';
  final k = 1;
  print('Input : ${input}');
  print('K : ${k}');
  final result = checkResult(input, k);
  print('Output : ${result}');
}

int checkResult(String input, int chance) {
  final intInput = int.tryParse(input);
  if (intInput == null) {
    return -1;
  }

  final isPalAlready = isPalindrome(input, 0);
  if (isPalAlready) {
    if (chance > 1) {
      final newPal = makeHighPalindrome(input, 0, chance, input);
      return int.parse(newPal);
    } else {
      return int.parse(input);
    }
  } else {
    final dif = countDiff(input, 0);
    final newPal = createPalindrome(input, 0, chance, input, chance > dif);
    final isPal = isPalindrome(newPal, 0);
    return isPal ? int.parse(newPal) : -1;
  }
}

String createPalindrome(String input, int index, int chance, String newPal, bool makeItHigher) {
  if (chance == 0 || index == (input.length ~/ 2)) {
    return newPal;
  }
  final first = input[index];
  final second = input[input.length - 1 - index];
  if (first == second) {
    return createPalindrome(input, index + 1, chance, newPal, makeItHigher);
  } else {
    final replaced = replaceIfPossible(int.parse(first), int.parse(second), chance, makeItHigher);
    if (replaced.isEmpty)
      return newPal;
    else {
      var newPalTemp = replaceAt(newPal, '${replaced[0]}', index);
      newPalTemp = replaceAt(newPalTemp, '${replaced[1]}', input.length - 1 - index);
      return createPalindrome(input, index + 1, replaced[2], newPalTemp, makeItHigher);
    }
  }
}

String makeHighPalindrome(String input, int index, int chance, String newPal) {
  if (chance <= 1 || index == (input.length ~/ 2)) {
    return newPal;
  }
  final first = input[index];
  if (int.parse(first) < 9) {
    var newPalTemp = replaceAt(newPal, '9', index);
    newPalTemp = replaceAt(newPalTemp, '9', input.length - 1 - index);
    return makeHighPalindrome(input, index + 1, chance - 2, newPalTemp);
  }

  return makeHighPalindrome(input, index + 1, chance, newPal);
}

bool isPalindrome(String input, int index) {
  if (index == ((input.length ~/ 2) - 1)) {
    return input[index] == input[(input.length - 1) - index];
  }
  return input[index] == input[(input.length - 1) - index] && isPalindrome(input, index + 1);
}

int countDiff(String input, int index) {
  if (index == ((input.length ~/ 2) - 1)) {
    return input[index] == input[(input.length - 1) - index] ? 0 : 1;
  }
  return (input[index] == input[(input.length - 1) - index] ? 0 : 1) + countDiff(input, index + 1);
}

List<int> replaceIfPossible(int first, int second, int chance, bool makeItHigher) {
  final highestReplacement = 9;
  if (chance > 1 && makeItHigher) {
    return [highestReplacement, highestReplacement, chance - 2];
  } else {
    if (chance == 0) {
      return [];
    }
    final highest = first > second ? first : second;
    return [highest, highest, chance - 1];
  }
}

String replaceAt(String input, String char, int index) {
  var arr = input.split('');
  arr[index] = char;
  return arr.join();
}
