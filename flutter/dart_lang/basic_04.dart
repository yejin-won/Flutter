main(){
  int? num1 = null;
  print(num1);

  num1 ??= 8; //num1이 null이면 num1에게 8을 준다
  print(num1);

  //삼항 연산자
  bool isPublic = true;
  var visibility = isPublic ? 'public' : 'private';
  print(visibility);

  int sum =0;
  for(int i =1 ; i<=10; i++){
    sum+=i;
  }

  print(sum);

  sum = 0;
  List<int> numlist = [1,2,5,6,8];
  for(int i in numlist){
    sum+=i;
  }
}