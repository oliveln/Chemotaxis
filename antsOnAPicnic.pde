// Walker [] army = {new Walker (), new Walker (), new Walker ()}; is fine but impractical
Walker [] betterArmy; //first call to new cuz of arrays
//NullPointerException comes from betterArmy = new Walker[x]; cuz the "apartments"  are empty, you need that for loop to actually call them

void setup(){
  noStroke();
  size(500,500);
  betterArmy = new Walker[100]; // sets array length
  for( int i = 0 ; i < betterArmy.length; i++){
    betterArmy[i] = new Walker((int)(Math.random()*width), (int)(Math.random()*height)); //second call to new cuz of arrays
  }

}

void draw(){
  picnicBlanket();
  for( int i = 0 ; i < betterArmy.length; i++){
    betterArmy[i].walk();
    betterArmy[i].show();
  }
  fill(198,137,88);
  ellipse(mouseX,mouseY,20,20);
}

class Walker{
  //two member variables 
  int myX, myY, myColor;
  //three member functionns
  //one special member function: constructor
  //whose job is to initialize the member variables
  Walker(){
    myX = width/2;
    myY = height/2;
  }
  Walker(int x, int y){ //overloading constructor
    myX = x;
    myY = y;
   
  }
  void walk (){
    int distanceX = mouseX - myX;
    int distanceY = mouseY - myY;
    if (Math.abs(distanceX) > 30 || Math.abs(distanceY) > 30){
      if (distanceX > 0){
        myX = myX + (int)(Math.random()*2)+1;
        } else {
          myX = myX - (int)(Math.random()*2)-1;
        }
      if (distanceY > 0){
        myY = myY + (int)(Math.random()*2)+1;
      }   else {
          myY = myY - (int)(Math.random()*2)-1;
        }
      }
      else {
        myX = myX + (int)(Math.random()*10)-5;
        myY = myY + (int)(Math.random()*10)-5;
      }
 }
  void show(){
  fill(0,0,0);
  ellipse(myX,myY,6,6);
  ellipse(myX-3,myY-3,5,5);
  ellipse(myX-5,myY-5,4,4);
  }
  
}//end of Walker class

 void picnicBlanket(){
   for(int row = 0; row < 5; row++){
     for(int column = 0; column < 5; column++){
         int X = column * 100;
         int Y = row * 100;
        if ((row + column) % 2 == 0){
         fill(255,0,0);
         } else {
           fill(255,255,255);
         }
         rect(X,Y,100,100);
       }  
     }

 }
