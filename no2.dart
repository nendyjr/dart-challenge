void main() {
  final input = ' { ( ( [ ] ) [ ] ) [ ] }';
  print('Input : ${input}');
  final cleanInput = input.replaceAll(' ', '');

  final result = isBraket(cleanInput, 0, []);
  print('Output : ${result ? 'YES' : 'NO'}');
}

bool isBraket(String input, int index, List<String> openBraket) {
  if (index == input.length) {
    return openBraket.isEmpty;
  }
  final current = input[index];
  if (current == ']' || current == '}' || current == ')') {
    if (openBraket.isEmpty) return false;

    if (isCorrectBraket(openBraket.last, current)) {
      var temp = [...openBraket];
      temp.removeLast();
      return isBraket(input, index + 1, temp);
    } else {
      return false;
    }
  } else {
    var temp = [...openBraket];
    temp.add(current);
    return isBraket(input, index + 1, temp);
  }
}

bool isCorrectBraket(String text1, String text2) {
  return (text1 + text2 == '()') || (text1 + text2 == '[]') || (text1 + text2 == '{}');
}
