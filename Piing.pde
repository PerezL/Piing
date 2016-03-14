Racket myRacket1; 
Racket myRacket2;

float xBall=320, yBall=160;
float xSpeed = 1;
float ballAngle;
float addSpeed=1;
float xMove;
float score=0;
int end=5;

void setup() { 
  size(640, 320);
  myRacket1 = new Racket(color(255), 10, height/2, 1, 0); 
  myRacket2 = new Racket(color(255), width-10, height/2, 1, 0);
}

void draw() { 
  scene();     
  ball();       
  movement();   
  show();
  message();
  quit();
}

// Display ball + movement 
void ball() {
  float xMove= xBall + xSpeed;
  stroke(0);
  fill(255);
  ellipse(xBall, yBall, 20, 20);

  if (key == ENTER) {
    xBall = xMove;
    yBall = yBall + ballAngle;
  }
}

// Scene : Background + net
void scene() {
  background(115, 255, 115);
  line(width/2, 0, width/2, height);
}

void message() {
  fill(0);
  text("Player 1: " + myRacket1.score, 15, 45);
  text("Player 2: " + myRacket2.score, width-85, 45);
}  

void quit() {
  if(myRacket2.score == end || myRacket1.score == end) {
   text("CONGRATULATION BUDDY",(width/2)-100,height/2); xSpeed = 0; text("Press esc to quit", width-100, 15);
  } else if (keyCode == 'c') {
     exit();
   }
  }

// Movement of the ball
void movement() {
  if (xBall > (myRacket2.xpos - 15) &&  (dist(yBall, yBall, myRacket2.ypos, myRacket2.ypos) < 25) || xBall < (myRacket1.xpos + 15) && (dist(yBall, yBall, myRacket1.ypos, myRacket1.ypos) < 25)) {
    xSpeed = xSpeed * -1; 
    ballAngle = random(-0.5, 0.5); 
    xSpeed = xSpeed * 1.1;
  } else if (xBall > width) {
    xBall = width/2;  myRacket1.score += 1;
  } else if (xBall < 0 ) {
    xBall = width/2; myRacket2.score += 1;
  } else if (yBall > (height-10) || yBall < 10) {
    ballAngle = ballAngle * -0.5;
  }
}

// Display and movement of both rackets
void show() {
  myRacket1.show(); 
  myRacket2.show(); 
  myRacket1.move1(); 
  myRacket2.move2();
}

// Class racket
class Racket { 
  color c; 
  float xpos; 
  float ypos; 
  float yspeed;
  float score;

  Racket (color tempC, float tempXpos, float tempYpos, float tempYspeed, float tempScore) { 
    c = tempC; 
    xpos = tempXpos; 
    ypos = tempYpos; 
    yspeed = tempYspeed;
    score = tempScore;
  }

  void show() {
    stroke(0); 
    fill(c); 
    rectMode(CENTER); 
    rect(xpos, ypos, 20, 40);
  }
  void move1() { 
    if (keyCode == 'U') { 
      ypos = ypos - yspeed;
    } else if (keyCode == 'D') { 
      ypos = ypos + yspeed;
    }
  }
  void move2() { 
    if (keyCode == UP) { 
      ypos = ypos - yspeed;
    } else if (keyCode == DOWN) { 
      ypos = ypos + yspeed;
    }
  }
}
