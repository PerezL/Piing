Racket myRacket1; 
Racket myRacket2;

void setup() 
{ 
  size(640, 320);
  myRacket1 = new Racket(color(255), 10, height/2, 1); 
  myRacket2 = new Racket(color(255), width-10, height/2, 1);
}

void draw() { 
  myRacket1.scene();    // Wrong ... the scene should not be related to myRacket1...
  myRacket1.ball();
  myRacket1.display(); 
  myRacket2.display(); 
  myRacket1.move1(); 
  myRacket2.move2();
}

class Racket { 
  color c; 
  float xpos; 
  float ypos; 
  float yspeed;

  Racket (color tempC, float tempXpos, float tempYpos, float tempYspeed) { 
    c = tempC; 
    xpos = tempXpos; 
    ypos = tempYpos; 
    yspeed = tempYspeed;
  }

  void ball() {
    float xBall=xpos+20,yBall=height/2,wBall=20,hBall=20;
    stroke(0);
    fill(255);
    ellipse(xBall,yBall,wBall,hBall);
  
    if (keyCode == ENTER) {
      xBall = xBall + 10;
    }
  }


  void scene() {
    background(155,155,155);
    line(width/2,0,width/2,height);
  }

  void display() { 
    stroke(0); 
    fill(c); 
    rectMode(CENTER); 
    rect(xpos, ypos, 20, 40);
  }

  void move2() { 
    if (keyCode == UP) { 
      ypos = ypos - yspeed;
    } else if (keyCode == DOWN) { 
      ypos = ypos + yspeed;
    }
  }

  void move1() { 
    if (keyCode == 'U') { 
      ypos = ypos - yspeed;
    } else if (keyCode == 'D') { 
      ypos = ypos + yspeed;
    }
  }
}
