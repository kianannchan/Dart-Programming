import 'dart:collection';
import 'dart:io';
import 'dart:math';

void main(){
  current currObj = current();
  currObj.randomNumber();
  while (true){
    print("Level ${currObj.level} , Multiplier ${currObj.multiplier}: Guess a number between 0 and ${currObj.max}");
    var user_input = stdin.readLineSync();
    bool result = currObj.guess(int.parse(user_input));
    if (result){
      currObj.randomNumber();
    }else {
      if (currObj.life == 0) {
        break;
      }
    }
  }
  print('Oh No! You lose at level ${currObj.level} ');
}

class data{
  int level = 1;
  int life = 10;
  int points = 0;
  int multiplier = 1;
  HashMap <int, int> score_board = HashMap <int, int>();
}

class current extends data{
  int hiddenNum;
  int max;

  int randomNumber(){
    max = super.level * 10;
    var random = Random();
    hiddenNum = random.nextInt(max);
  }

  bool guess(int guess){
    if (guess != hiddenNum){
      super.life--;
      if (guess > hiddenNum){
        print ('You guess wrongly! Should be lower! Life left: ${super.life}');
      }else{
        print ('You guess wrongly! Should be higher! Life left: ${super.life}');
      }
      return false;
    }
    super.level++;
    super.points += super.level * super.life * super.multiplier;
    super.score_board.addAll({super.level : super.life});
    print ('You guess correctly [current points: ${super.points}]');
    if (super.points > super.multiplier * 50){
      super.points -= super.multiplier * 100;
      super.multiplier*= 2;
    }
    super.life = 10;
    return true;
  }
}





