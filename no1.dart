void main() {
  final query = [12, 10, 5, 3];
  final input = 'bbbccddhhh';
  final str = sortString(input);
  print('Input : ${input}');
  print('Query : ${query}');
  final list = stringToWeight(str);

  final result = queryWeight(query, list);
  print('Output: ${result}');
}

String sortString(String input) {
  var arr = input.split('');
  arr.sort();
  final str = arr.join();

  return str;
}

int letterToInt(String letter) {
  final letters = "abcdefghijklmnopqrstuvwxyz";

  return letters.indexOf(letter) + 1;
}

List<int> stringToWeight(String input) {
  var lastLetter = '';
  var countLast = 0;
  var weigthList = <int>[];
  for (var letter in input.split('')) {
    countLast = lastLetter == letter ? countLast + 1 : 1;
    final index = letterToInt(letter);
    weigthList.add(index * countLast);
    lastLetter = letter;
  }

  return weigthList;
}

List<String> queryWeight(List<int> query, List<int> weightList) {
  var result = <String>[];
  for (var item in query) {
    result.add(weightList.indexOf(item) > -1 ? 'Yes' : 'No');
  }

  return result;
}
