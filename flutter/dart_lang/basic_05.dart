main() {
  List<int> list1 = [1, 3, 5, 7, 9];
  int sum = 0;
  for (int i in list1) {
    sum += i;
  }
  print("합계 : $sum ");

  List<int> list2 = [10, 30, 50, 70, 90];
  int sum2 = 0;
  for (int i in list2) {
    sum2 += i;
  }
  print("합계 : $sum2");

  addList(List list) {
    int sum = 0;
    for (int i in list) {
      sum += i;
    }
    print("합계 : $sum ");
  }
  
  addList(list1);
  addList(list2);

  int addList2(List list){
    int sum = 0;
    for(int i in list){
      sum += i;
    }
    return sum;
  }

  int result = addList2(list1);
  print(result);
}
