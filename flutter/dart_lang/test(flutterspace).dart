main(){
  String displauCharacter = "Hello";
  String character;
  List str =[];

  str = displauCharacter.split('');
  print(str);
  character = str[0];
  character += str[1];
  character += str[2];
  print(character);
}