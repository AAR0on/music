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
    sphereDetail(20, 5);
  }
  
  void update()
  {
    theta += speed;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    stroke(c);
    strokeWeight(7);
    //rotateY(theta);
    rotateX(45);
    fill(255);
    box(size);
    popMatrix();
  }
  
  
  
}
