float curlx = 0; 
float curly = 0; 
float f = sqrt(2)/2.; 
float delay = 10; 
float growth = 0; 
float growthTarget = 0; 
 
 
void setup() 
{ 
  size(800,800); 
} 
void draw() 
{ 
  background(250); 
  stroke(0); 
  curlx += (radians(360./height*random(max(height, width))-curlx))/delay; 
  curly += (radians(360./height*random(min(height, width))-curly))/delay; 
  translate(width/2,height/3*2); 
  line(0,0,0,height/2); 
  branch(height/4.,17); 
  growth += (growthTarget/10-growth+1.)/delay;
  
  saveFrame("real/######.png");
} 
 

 
void branch(float len,int num) 
{ 
  len *= f; 
  num -= 1; 
  if((len > 1) && (num > 0)) 
  { 
    pushMatrix(); 
    rotate(curlx); 
    line(0,0,0,-len); 
    translate(0,-len); 
    branch(len,num); 
    popMatrix(); 

    len *= growth; 
    pushMatrix(); 
    rotate(curlx-curly); 
    line(0,0,0,-len); 
    translate(0,-len); 
    branch(len,num); 
    popMatrix(); 
  } 
}
