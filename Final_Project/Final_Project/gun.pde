class gun {
    float x;
    float y;
    boolean live;
    
    gun( float newx, float newy ) {
        x = newx + 20;
        y = newy + 10;
        live = true;
    }
    
    void hit() {
        for (int d = 0; d < mobs.length; d++) {
            mob e = mobs[d];
            if(y > (e.y - (e.r/2)) && (y < (e.y + (e.r/2)))) {
                if (x < e.x) {
                    if ((x + 60) >= e.x) {
                        live = false;
                        e.live = false;
                        score = score + 1;
                        return;
                    }
                }
            }
        }
    }
    
    void render() {
        fill(255);
        stroke(0);
        strokeWeight(1.0);
        ellipse(x,y,5,5);
        x += 60.0;
        if (x > 800) {
            
            live = false;
        }
    }
}
