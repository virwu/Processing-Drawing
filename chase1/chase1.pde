//Dangnamit Tom! Watch where you're going! We're painting here!
//No! Not the paints! Stop trailing the floor! EEK!
//Catch that mouse! Hurry! Hurry! I don't care if you're trailing paint all over the floor!
//Just catch him! 

//To begin the chase press the Left Mouse button (PC) or Mouse Button (Mac).
//To reset the chase press the Right Mouse button (PC) or Control + Mouse Button (Mac).

float startx;
float starty;

float distX;
float distY;

float newX;
float newY;

boolean chase = false;

void setup() 
{
  size(400, 400);
  smooth();
  noStroke();
  frameRate(60);
  startx = random(50, 400);
  newX = startx;
  starty = random(50, 400);
  newY = starty;
  ellipse(startx, starty, 10, 10);
  background(51);
}

void draw() 
{
  gameCheck();
  if (chase) {
    cat();
    distanceCheck();
    wrapCheck();
    mouse();
    }
}

void gameCheck() {
  if (mouseButton == LEFT) {
    chase = true;
  }
  if (mouseButton == RIGHT) {
    chase = false;
    setup();
  }
}

void cat() {
  fill (0,191,255);
  ellipse(mouseX, mouseY, 15, 15);
}

void mouse() {
  fill(222,184,135);
  ellipse(newX, newY, 10, 10);
}

void distanceCheck() {
distX = mouseX-newX;
distY = mouseY-newY;

  if (distX < 0 && distX >= -10) {
    newX+=1;
    distX = newX;
  }
  
  if (distY < 0 && distY >= -10) {
    newY+=1;
    distY = newY;
  }
  
  if (distX > 0 && distX <= 10) {
    newX-=1;
    distX = newX;
  } 
  
  if (distY > 0 && distY <= 10) {
    newY-=1;
    distY = newY;
  }
}

void wrapCheck() {
  if (newX > 400) {
    newX = 10;
  }
  
  if (newX < 0) {
    newX = 390;
  }
  
  if (newY > 400) {
    newY = 10;
  } 
  
  if (newY < 0) {
    newY = 390;
  }
}