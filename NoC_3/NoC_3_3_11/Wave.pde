class Wave {
  
 PVector leftEnd;
 float amp;
 float angleVel;
 float angle;
 float startAngle;
 float len;
 float spacing;
 int balls;
 
 Wave(PVector leftEnd_, float amp_, float angleVel_, float len_) {
   
  leftEnd = leftEnd_.copy();
  amp = amp_;
  startAngle = 0;
  angleVel = angleVel_;
  angle = 0;
  len =  len_;
  balls = 20;
  spacing = len / balls;
 }
 
 void display() {
  float angle = startAngle;
  for(int i = 0; i < balls/2; i++) {
   ellipse(leftEnd.x + i * spacing, leftEnd.y + amp * sin(angle), spacing, spacing);
   angle += angleVel;
  }
    for(int i = balls/2; i < balls; i++) {
   ellipse(leftEnd.x + i * spacing, leftEnd.y + amp * sin(angle), spacing, spacing);
   angle += angleVel*2;
  }
  startAngle += 0.05;
 }

 
  
}
