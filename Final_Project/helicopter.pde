class Helicopter
{
    boolean up=false;             
    boolean down=false;
    boolean left=false;
    boolean right=false;
    boolean live;
    
  
    
  
    float ym;
    float xm;
    float cx = 400;
    float cy = 300;
  
    
    float x;
    float y;
    PVector dir;
    float speed;
    
    Helicopter() {
        x = width / 3;
        y = height / 2;
        speed = 0;
        dir = new PVector(0,0);
        live = true;
    }
    
    void render() {
   
        noStroke();
        fill(0);
        ellipse(x-17,y+2,10,10);     //rotor
        rect(x,y, 20, 11);           
        rect(x-15,y,15,4);           //tail
        stroke(0);
        strokeWeight(2);
        line(x,y+15,x+18,y+15);      //bottom leg
        line(x+9,y,x+9,y-5);         //main rotor
        line(x+5,y+11,x+5,y+15);     //left leg
        line(x+12,y+11,x+12,y+15);   //right leg
        if (frameCount % 2 == 0) {
            line(x-13,y-5,x+9,y-5);    //left rotor
        }
        else {
            line(x+9,y-5,x+31,y-5);    //right rotor
        }
    }
    
    void move() {
        x += dir.x;
        y += dir.y;
        
        ym = map(abs(mby-cy),50,250,0.0,1.0);
        xm = map(abs(mbx-cx),50,400,0.0,1.0);
                
        if(up == true) {
            dir.y -= (0.75 * ym);
        }
        if (down == true) {
            dir.y += (1.2 * ym);
        }
        if (right == true) {
            dir.x += (1.0 * xm);
            
        }
        if (left == true) {
            dir.x -= (1.0 * xm);
        }
        if(x < 0) {
            x = 0;
            dir.x *= -1.0;
        }
        else if(x > width) {
            x = width;
            dir.x *= -1.0;
        }
        if(y < 0) {
            y = 0;
            dir.y *= -1.0;
        }
        else if(y > height) {
            y = height;
            dir.y *= -1.0;
        }
        
        dir.x *= .9;
        dir.y *= .9;
    }
    
    
    void collision() {
        for (int d = 0; d < mobs.length; d++) {
            mob e = mobs[d];
            if(!(((y-5) > (e.y + (e.r/2))) || ((y+15) < (e.y - (e.r/2)))))
            {
                if (!(((x-15) > e.x) || (((x+22)+dir.x) < (e.x+e.speedx))))
                {
                        live = false;
                        page = 2;
                        return;
                    }
                    return;
                }
            }
        
    }
}
