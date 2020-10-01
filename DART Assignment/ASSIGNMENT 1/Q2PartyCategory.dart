/*
Q2. (Asked by Amazon) O(N)
A professor went to a party. 
Being an erudite person, he classified 
the party into two categories. 
He proposed that if all the persons 
in the party are wearing different 
colored robes, then that is a girl’s 
only party. If we even get one 
duplicate color, it must be a boy’s 
party. The colors of the robes are 
represented by positive integers.

Input
The first line of each test case 
contains an integer T, denoting the 
no of test cases. Then T test cases 
follow. The first line of each 
test case contains an integer N denoting
the number of people in the party. 
In the next line are N space separated 
values of Ai denoting the color of the 
robes.

Output
For each test case, print “BOYS” 
without quotes if it’s a boy’s party, 
else print “GIRLS”

*/


import 'dart:io';

List<int> getPartyRobes(){
  List<int> colorList=new List();
  String substr,color;
  int no;
  print("Enter the string");
  color=(stdin.readLineSync());
  substr="";
  for(int i=0;i<=(color.length-1);i++){
    if(color[i]==" "){
      no=int.parse(substr);
      colorList.add(no);
      substr="";
    }
    else{
      substr+=color[i];
      if(i==(color.length-1)){
        no=int.parse(substr);
        colorList.add(no);
        substr="";
      }
    }
  }
  return colorList;
}

List<String> getPartyCategory(List<List<int>> PartyList){
  List<String> PartyCat=new List();
  for(List<int> li in PartyList){
    if(li.length==(li.toSet().length)){
      PartyCat.add("GIRLS");
    }
    else{
      PartyCat.add("BOYS");
    }
  }
  return PartyCat;
}

void main(){
  List<String> PartyCategory=new List();
  List<List<int>> PartyList;
  int no;
  print("Enter the number of test case:");
  no=int.parse(stdin.readLineSync());
  PartyList=new List(2);
  for(int i=0;i<no;i++){
    PartyList[i]=getPartyRobes();
  }
  //print(PartyList);
  PartyCategory=getPartyCategory(PartyList);
  for(int i=0;i<no;i++){
    print("Party ${i+1}:${PartyList[i]} Category ${PartyCategory[i]}");
  }
}
