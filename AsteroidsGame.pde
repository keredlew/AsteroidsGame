//your variable declarations here\
Star[]Kirby = new star[50];
Spaceship Nebula;
public void setup() 
{
  background (0);
  Nebula = new Spaceship();
  size (400,400);
  for (i = 0; i < Kirby.length; i++);
  {
    Kirby[i] = new Star();
  }
}
public void draw() 
{
  
}
class star
{
  private double myX,myY,my2X,my2Y;
  public star()
}
class SpaceShip extends floater  
{   
   Spaceship()
   {
   Corners = 13;
   xCorners = new int[corners];
   yCorners = new int[corners];
   xCorners[0] = 17*factor;
   yCorners[0] = 0*factor;
   xCorners[1] = 12*factor;
   yCorners[1] = 5*factor;
   xCorners[2] = -6*factor;
   yCorners[2] = 5*factor;
   xCorners[3] = -6*factor;
   yCorners[3] = 9*factor;
   xCorners[4] = -17*factor;
   yCorners[4] = 9*factor;
   xCorners[5] = -17*factor;
   yCorners[5] = 2*factor;
   xCorners[6] = -7*factor;
   yCorners[6] = 2*factor;
   xCorners[7] = -7*factor;
   yCorners[7] = -2*factor;
   xCorners[8] = -17*factor;
   yCorners[8] = -2*factor;
   xCorners[9] = -17*factor;
   yCorners[9] = -9*factor;
   xCorners[10] = -6*factor;
   yCorners[10] = -9*factor;
   xCorners[11] = -6*factor;
   yCorners[11] = -5*factor;
   xCorners[12] = 12*factor;
   yCorners[12] = -5*factor;
   myColor = color(255,182,193);
    myCenterX = 200;
    myCenterY = 200;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    stroke (0,0,0);
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
}
  abstract class stars{} 
