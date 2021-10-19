class Asteroid extends GameObject {

  Asteroid () {
    lives = 1;
 score = 0;
    loc = new PVector (random(0, width), random(0, height));
    velocity= new PVector(0, 1);
    velocity.rotate(random(0, TWO_PI));

    size =100;
  }

  Asteroid(int s, float x, float y) {
    lives = 1;
    loc = new PVector(x, y);
    velocity= new PVector(0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = s;
  }


  void show() {
    noFill();
    stroke(255);
    ellipse(loc.x, loc.y, size, size);
  }


  void act() {
    super.act();
    if (score == 21) {
      mode = GAMEOVER;
      win = true;
    }
    int i = 0;
    while (i < myObject.size()) {
      GameObject myObj = myObject.get(i);
      if (myObj instanceof Bullet ) {
        if (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y)<= size/2 +myObj.size) {

          myObj.lives = 0;
          lives =0;



          if (score == 21) {
            mode = GAMEOVER;
            win = true;
          }
          
          if (size > 25) {

            myObject.add(new Asteroid(size/2, loc.x, loc.y));
            myObject.add(new Asteroid(size/2, loc.x, loc.y));
            print (score,"h");
          }


          myObject.add(new Blast(loc.x, loc.y));
          myObject.add(new Blast(loc.x, loc.y));
          myObject.add(new Blast(loc.x, loc.y));
          myObject.add(new Blast(loc.x, loc.y));
          myObject.add(new Blast(loc.x, loc.y));
          myObject.add(new Blast(loc.x, loc.y));
          myObject.add(new Blast(loc.x, loc.y));
          myObject.add(new Blast(loc.x, loc.y));
          myObject.add(new Blast(loc.x, loc.y));
          myObject.add(new Blast(loc.x, loc.y));
          myObject.add(new Blast(loc.x, loc.y));
          myObject.add(new Blast(loc.x, loc.y));
          score = score  + 1;
        }
      }



      if (myObj instanceof Ship) {
        if (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y)<= size/2 +myObj.size) {
          myObj.lives =   myObj.lives - 1;




 score = score + 1;
        
          print (score,"h");
        
          if (score == 21) {
            mode = GAMEOVER;
            win = true;
          }
          if (size > 25) {
  lives = lives - 1;
   
            myObject.add(new Asteroid(size/2, loc.x, loc.y));
            myObject.add(new Asteroid(size/2, loc.x, loc.y));
          }
        }
      }
      i ++;
    }
  }
}
