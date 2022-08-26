main(){
  checkVersion();
  print('End process');
}

// ASync (비동기) : 데이터의 퍼포먼스를 늘리는 방식 
Future checkVersion() async {
  var version = await lookupVersion(); // 실행 후 12,'End process' 순서를 따르기 위해 
                                      // 다른 것이 종료 될때까지 기다리기 : End process -> 12
  print(version);
}

int lookupVersion(){
  return 12;
}