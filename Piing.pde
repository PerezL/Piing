Racket myRacket1; 
Racket myRacket2;

void setup() 
{ size(640,320);
myRacket1 = new Racket(color(255,0,0),10,height/2,1); 
myRacket2 = new Racket(color(0,255,0),width-10,height/2,1); 
}

void draw() { 
background(155,155,155); 
myRacket1.display(); 
myRacket2.display(); 
myRacket1.move1(); 
myRacket2.move2(); }

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

void display() { 
stroke(0); 
fill(c); 
rectMode(CENTER); 
rect(xpos,ypos,20,40); 
}

void move1() { 
if (keyCode == UP) { 
ypos = ypos - yspeed; 
} else if (keyCode == DOWN) { 
ypos = ypos + yspeed; 
} 
}

void move2() { 
if (keyCode == 'U') { 
ypos = ypos - yspeed; 
} else if (keyCode == 'D') { 
ypos = ypos + yspeed; 
} 
}

}
