class mob
{
    boolean blownup = false;
    boolean live;
    float speedx;
    float speedy;
    float level=10;
    int r;                   
    int mobDamage;
    float y;
    float x;
    float Mcolor = random(100);
    float py1, py2, py3, py4, py5;
    float px1, px2, px3, px4, px5;
    float rot = 0.0;  

    
    
    mob(int tempr) {
        r = tempr;
        speedx = random(-1.0*level,-0.7*level);
        speedy = random(-2.0,2.0);
        x = width;
        y = random(10,height-10);
        live = true;
    }
    
    void render() {
        x += speedx;
        y += speedy;
        stroke(Mcolor);
      //  strokeWeight();
     //   ellipse(x,y,r,r);
          px1 = r*cos(2.0*PI*0.0+rot)+x;   px2 = r*cos(2.0*PI*0.2+rot)+x;   
          px3 = r*cos(2.0*PI*0.4+rot)+x;  
          px4 = r*cos(2.0*PI*0.6+rot)+x;   px5 = r*cos(2.0*PI*0.8+rot)+x;  
          py1 = r*sin(2.0*PI*0.0+rot)+y;    py2 = r*sin(2.0*PI*0.2+rot)+y;    
          py3 = r*sin(2.0*PI*0.4+rot)+y;
          py4 = r*sin(2.0*PI*0.6+rot)+y;   py5 = r*sin(2.0*PI*0.8+rot)+y;
          line(px1, py1, px3, py3);    line(px3, py3, px5, py5);   line(px5, py5, px2, py2);   line(px2, py2, px4, py4);   line(px4, py4, px1, py1);
          rot+=2;
    
        
        if (x < 0) {
            live = false;
        }
    }
}
