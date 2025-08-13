import 'dart:math';

String generatePassword(){
  const String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String lower = 'abcdefghijklmnopqrstuvwxyz';
  const String numbers = '0123456789';
  const String symbols = '!@#\$%^&*()';

  String allChars=upper+lower+numbers+symbols;
  Random random=Random();
  List<String> password=[];

  password.add(upper[random.nextInt(upper.length)]);
  password.add(upper[random.nextInt(upper.length)]);
  password.add(lower[random.nextInt(lower.length)]);
  password.add(lower[random.nextInt(lower.length)]);
  password.add(numbers[random.nextInt(numbers.length)]);
  password.add(numbers[random.nextInt(numbers.length)]);
  password.add(symbols[random.nextInt(symbols.length)]);
  password.add(symbols[random.nextInt(symbols.length)]);
  for(int i=0;i<4;i++){
    password.add(allChars[random.nextInt(allChars.length)]);
  }

  password.shuffle(random);

  return password.join();
}