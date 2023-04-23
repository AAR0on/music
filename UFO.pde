class UFO
{
  float size;
  float speed;
  float theta;
  color c;
  PVector pos;
  
  UFO()
  {
    this(200, 0.05f, color(255, 255, 255), width/2, height/2, 50f);
  }
  
  UFO(float size, float speed, color c, float x, float y, float z)
  {
    this.size = size;
    this.speed = speed;
    this.c = c;
    theta = 0;
    this.pos = new PVector(x, y, z);
    //sphereDetail(20, 5);
  }
  
  void update()
  {

  }
  
  void render()
  {
    pushMatrix();
    
    //Cockpit
    translate(pos.x, pos.y, pos.z);
    stroke(c);
    strokeWeight(7);
    rotateX(45);
    rotateY(theta);
    fill(255);
    box(size);
    
    //Left Wing
    stroke(c);
    strokeWeight(4);
    fill(255);
    translate(0 - size, 0, 0);
    box(size/3);
    translate(0, 0 + size/6, 0);
    noStroke();
    fill(30, 255, 255);
    sphere(size/8);
    
    //Right Wing
    stroke(c);
    strokeWeight(4);
    fill(255);
    translate(0 + size*2, 0 - size/6, 0);
    box(size/3);
    translate(0, 0 + size/6, 0);
    noStroke();
    fill(30, 255, 255);
    sphere(size/8);
    
    //Thrusters
    translate(0, 0 + size/8, 0);
    sphere(size/12);
    translate(0 - size * 2, 0, 0);
    sphere(size/12);
    translate(0, 0 + size/12, 0);
    sphere(size/16);
    translate(0 + size*2, 0, 0);
    sphere(size/16);
    
    popMatrix();
  }
  
  
  
}
