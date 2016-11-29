SpaceShip kirby;
Star [] stars;
ArrayList <Asteroids> poo;
public void setup() 
{
  size (500,500);
  background(0);
  kirby = new SpaceShip();
  
  stars = new Star[5000];
  for(int i = 0; i < 1000; i++)
  {
    stars[i] = new Star();
  }
  poo = new ArrayList <Asteroids>();
  for (int j = 0; j < 20; j++)
  {
    poo.add(new Asteroids());
  }
}

public void draw() 
{
  background(0);
  kirby.show();
  kirby.move();
  
  for (int i = 0; i < 1000; i++)
  {
    stars[i].show();
  }

  for (int j = 0; j < 20; j++)
  {
    poo.get(j).show();
    poo.get(j).move();
  
    double distance = dist(kirby.getX(),kirby.getY(),poo.get(j).getX(), poo.get(j).getY());
    if(distance < 20)
    {
      poo.remove(j);
    poo.add(new Asteroids());
 }
}
}
public void keyPressed() 
{
  if(keyPressed == true && key == 'a')
  {
    kirby.rotate(-10);
  }
  if(keyPressed == true && key == 'd')
  {
    kirby.rotate(10);
  }
  if(keyPressed == true && key == 'w')
  {
    kirby.accelerate(0.50);
  }
  if(keyPressed == true && key == 's')
  {
    kirby.myDirectionY = 0;
    kirby.myDirectionX =0;
    kirby.myPointDirection = Math.random()*360;
    kirby.myCenterX = Math.random()*500;
    kirby.myCenterY = Math.random()*500;
  }
}

public class Star
{
  private int posX, posY, mySize;
  public Star()
  {
    posX = ((int)(Math.random()*501));
    posY = ((int)(Math.random()*501));
    mySize = ((int)(Math.random()*6));
  }
  public void show()
  {
    noStroke();
    fill(50, 50, 250);
    ellipse(posX, posY, mySize, mySize);
  }
}

public class SpaceShip extends Floater  
{   
    public SpaceShip(){
    corners = 13;
   xCorners = new int[corners];
   yCorners = new int[corners];
   xCorners[0] = 17;
   yCorners[0] = 0;
   xCorners[1] = 12;
   yCorners[1] = 5;
   xCorners[2] = -6;
   yCorners[2] = 5;
   xCorners[3] = -6;
   yCorners[3] = 9;
   xCorners[4] = -17;
   yCorners[4] = 9;
   xCorners[5] = -17;
   yCorners[5] = 2;
   xCorners[6] = -7;
   yCorners[6] = 2;
   xCorners[7] = -7;
   yCorners[7] = -2;
   xCorners[8] = -17;
   yCorners[8] = -2;
   xCorners[9] = -17;
   yCorners[9] = -9;
   xCorners[10] = -6;
   yCorners[10] = -9;
   xCorners[11] = -6;
   yCorners[11] = -5;
   xCorners[12] = 12;
   yCorners[12] = -5;
   myColor = color(255,182,193);
    myCenterX = 250;
    myCenterY = 250;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    stroke (0,0,0);
    }
    
    public void setX(int x){ myCenterX = x;}
    public int getX(){ return (int)myCenterX;}
    public void setY(int y){ myCenterY = y;}
    public int getY(){ return (int)myCenterY;}
    public void setDirectionX(double x){ myDirectionX = x;}
    public double getDirectionX(){ return myDirectionX;}
    public void setDirectionY(double y){ myDirectionY = y;}
    public double getDirectionY(){ return myDirectionY;}
    public void setPointDirection(int degrees){ myPointDirection = degrees;}
    public double getPointDirection(){ return myPointDirection;}
}

public class Asteroids extends Floater
{
  private int rotSpeed;
  public Asteroids()
  {
    corners = 13;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 9;
    yCorners[0] = 0;
    xCorners[1] = 10;
    yCorners[1] = 3;
    xCorners[2] = 9;
    yCorners[2] = 5;
    xCorners[3] = 6;
    yCorners[3] = 4; 
    xCorners[4] = 3;
    yCorners[4] = 2;
    xCorners[5] = -3;
    yCorners[5] = 2;
    xCorners[6] = -6;
    yCorners[6] = 4;
    xCorners[7] = -9;
    yCorners[7] = 5;
    xCorners[8] = -10;
    yCorners[8] = 3;
    xCorners[9] = -9;
    yCorners[9] = 0; 
    xCorners[10] = -5;
    yCorners[10] = -3;
    xCorners[11] = 0;
    yCorners[11] = -4;
    xCorners[12] = 6;
    yCorners[12] = -3;
    myColor = color(255,204,0);
    myCenterX = (int)(Math.random()*501);
    myCenterY = (int)(Math.random()*501);
    myPointDirection = 0;
    myDirectionX = (int)(Math.random()*4 - 2);
    if(myDirectionX == 0) {myDirectionX++;}
    myDirectionY = (int)(Math.random()*4 - 2);
    if(myDirectionY == 0) {myDirectionY++;}
    rotSpeed = (int)(Math.random()*3-5);
    if(rotSpeed == 69) {rotSpeed ++;}
    
  }
  public void move()
  {
    rotate((int)(rotSpeed));
    super.move();
  }

    public void setX(int x){ myCenterX = x;}
    public int getX(){ return (int)myCenterX;}
    public void setY(int y){ myCenterY = y;}
    public int getY(){ return (int)myCenterY;}
    public void setDirectionX(double x){ myDirectionX = x;}
    public double getDirectionX(){ return myDirectionX;}
    public void setDirectionY(double y){ myDirectionY = y;}
    public double getDirectionY(){ return myDirectionY;}
    public void setPointDirection(int degrees){ myPointDirection = degrees;}
    public double getPointDirection(){ return myPointDirection;}

}


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
}
  
