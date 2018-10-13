//Made by dooplu @ github.com/dooplu

import processing.sound.*;

SoundFile score;
SoundFile wall;
SoundFile paddle;


int p1y = 240;
int p2y = 240;
int ballx = 315;
int bally = 235;
int xspeed = 0;
int yspeed = 0;
int p1score = 0;
int p2score = 0;
boolean ingame = false;
boolean p1up = false;
boolean p1down = false;
boolean p2up = false;
boolean p2down = false;

void setup()
{
  size(640, 480);
  score = new SoundFile(this, "Score.wav");
  wall = new SoundFile(this, "WallHit.wav");
  paddle = new SoundFile(this, "PaddleHit.wav");
  PImage icon = loadImage("sketch.png");
  surface.setIcon(icon);
}


void draw()
{
 background(0);
 textSize(60);
 text(p2score, width/2+40, 70);
 text(p1score, width/2-80, 70);
 rect(600, p2y, 15, 85);
 rect(20, p1y, 15, 85);
 ballx += xspeed;
 bally += yspeed;
 rect(ballx, bally, 10, 10);
 stroke(255);
 line(width/2, 0, width/2, height);
 p1y = constrain(p1y, 0, height - 85);
 p2y = constrain(p2y, 0, height - 85);
 if( ballx >= 595 && bally >= p2y && bally <= p2y + 85 || ballx <= 40 && bally >= p1y && bally <= p1y + 85)
 {
   xspeed *= -1;
   paddle.play();
 }
 if(bally <= 5 || bally >=  height - 5)
 {
   yspeed *= -1;
   wall.play();
 }
 if(ballx >= 600)
  {
    ++p1score;
    xspeed = 0;
    yspeed = 0;
    ballx = 315;
    bally = 235;
    ingame = false;
    score.play();
  }
  else if(ballx <= 30)
  {
    ++p2score;
    xspeed = 0;
    yspeed = 0;
    ballx = 315;
    bally = 235;
    ingame = false;
        score.play();

  }
  if(p1up == true)
  {
    p1y -= 10;
  }
  else if(p1down == true)
  {
    
    p1y += 10;
  }
  if(p2up == true)
  {
    p2y -= 10;
  }
  else if(p2down == true)
  {
    p2y += 10;
  }
}

void keyPressed()
{
  if (key == ENTER)// checking to see if the player hit the enter key
  {
   StartGame(); 
  }
 if(key == 'W' || key == 'w')  // all the controls >
 {
  p1up = true; 
 }
 if(key == 'S' || key == 's')
 {
  p1down = true; 
 }
 if(key == CODED)
 {
 if (keyCode == UP)
 {
   p2up = true;
 }

 if (keyCode == DOWN) // < controls
 {
 p2down = true;  
 }
 if(keyCode == ESC)
 {
   exit();
 }
 }
}

void keyReleased()
{
 if(key == 'W' || key == 'w')  // all the controls >
 {
  p1up = false; 
 } 
 if(key == 'S' || key == 's')
 {
  p1down = false;
 }
 if(key == CODED){
 if(keyCode == UP)  // all the controls >
 {
  p2up = false; 
 } 
 if(keyCode == DOWN)
 {
  p2down = false; 
 }
 }
}

void StartGame(){
 if (ingame == false)
 {
  xspeed += 6;
  yspeed += 6;
  ingame = true;
 }
 
}