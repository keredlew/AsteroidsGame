SpaceShip Derk;
Star [] Lew;
public void setup() 
{
  size (500,500);
  background(0);
  Derk = new SpaceShip();
  
  Lew = new Star[5000];
  for(int i = 0; i < 1000; i++)
  {
    Lew[i] = new Star();
  }
}
public void draw() 
{
  background(1);
  Derk.show();
  Derk.move();
  
  for (int i = 0; i < 1000; i++)
  {
    Lew[i].show();
  }
public void keyPressed()
{
  if(keyCode == 'w')
  {
    Derk.accelerate(0.08);
  }
  else if(keyCode == 's')
  {
    Derk.accelerate(-0.08);
  }
  else if (keyCode == 'a')
  {
    Derk.rotate(-25);
  }
  else if (keyCode == 'd')
  {
    Derk.rotate(25);
  }
  else if (key == ' ')
  {
    Derk.setX((int)(Math.random()*501));
    Derk.setY((int)(Math.random()*501));
    Derk.setPointDirection((int)(Math.random()*361));
  }
  else if(key == 'e')
  {
    Derk.setDirectionX(0);
    Derk.setDirectionY(0);
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
    fill(170, 174, 170);
    ellipse(posX, posY, mySize, mySize);
  }
}
public class SpaceShip extends Floater  
{   
    public SpaceShip(){
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
  public void move()   //move the floater in the current direction of travel
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