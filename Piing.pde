Racket myRacket1; 
Racket myRacket2;

float xBall=320, yBall=160;
float xSpeed = 1;
float ballAngle;
float addSpeed=1;
float xMove;

void setup() { 
  size(640, 320);
  myRacket1 = new Racket(color(255), 10, height/2, 1); 
  myRacket2 = new Racket(color(255), width-10, height/2, 1);
}

void draw() { 
  scene();     
  ball();       
  movement();   
  show();
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
  background(155, 255, 155);
  line(width/2, 0, width/2, height);
}

// Movement of the ball
void movement() {
  if (xBall > (myRacket2.xpos - 15) &&  (dist(yBall,yBall,myRacket2.ypos,myRacket2.ypos) < 25) || xBall < (myRacket1.xpos + 15) && (dist(yBall,yBall,myRacket1.ypos,myRacket1.ypos) < 25)) {
    xSpeed = xSpeed * -1; ballAngle = random(-1.5,0.5); xSpeed = xSpeed * 1.1;
  } else if (xBall > width || xBall < 0 ) {
    xBall = width/2;
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

  Racket (color tempC, float tempXpos, float tempYpos, float tempYspeed) { 
    c = tempC; 
    xpos = tempXpos; 
    ypos = tempYpos; 
    yspeed = tempYspeed;
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
