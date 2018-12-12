Helicopter helicopter;
mob mob;
gun gun;
Background backgrounds;


PImage background;
int Gamelevel=60;
mob[] mobs = new mob[0];
gun[] bullet = new gun[0];
int n = 0;
int nE = 2;
int page = 1;
int score = 0;
int phaseTime=0;
int FinalPhase;
float mbx = 0;
float mby = 0;
String Tscore;




PFont font;

void setup() {
    background(255);
    size(800,600,P2D);
    frameRate(30);
    helicopter = new Helicopter();
    addmob();
    
    font = loadFont("Font_Setting.vlw");
    backgrounds = new Background();
    FinalPhase = 0;
    
}

void draw() {
    
    backgrounds.render();
    
    fill(0);
    stroke(0);
    Tscore = "score: " + score;
    textFont(font,30);
    text(Tscore,40,40);
    
    if (page == 1) {
        if (helicopter.live == true) {
            helicopter.render();
            helicopter.move();
        }
        if(frameCount % Gamelevel == 0) {
            addmob();
            addmob();
        }
        collisions();
        hits();
        mobRender();
        
        
        for (int i = 0; i < bullet.length; i++) {
            if (bullet[i].live == true) {
                bullet[i].render();
            }
        }
        
        gunReaper();
        mobReaper();
        
        
        
    }
    
    else if (page == 2) {
        background(155);
        textAlign(CENTER);
        fill(255, 50, 50);
        textFont(font,80);
        text("End Game", width/2, height/2);
        FinalPhase += 1;
        if (FinalPhase > 300) {
            exit();
        }
    }
    
    if (score == 20&&phaseTime>=60&phaseTime<120) {
        background(155);
        textAlign(CENTER);
        if (frameCount % 2 == 0) {
            fill(0);
        }
        else {
            fill(100);
        }
        text("Level 3", width/2, height/2);
        Gamelevel = 20;
        phaseTime ++;
        
    }
    
    if (score == 10&&phaseTime>=0&&phaseTime<60) {
        background(155);
        textAlign(CENTER);
        if (frameCount % 2 == 0) {
            fill(0);
        }
        else {
            fill(1);
        }
        text("Level 2", width/2, height/2);
        Gamelevel = 40;
        phaseTime ++;
        
        
    }
    
}

void hits() {
    for (int i = 0; i < bullet.length; i++) {
        if (bullet[i].live) {
            bullet[i].hit();
        }
    }
}

void collisions() {
    if (helicopter.live == true) {
        helicopter.collision();
    }
}



void addmob() {

    for (int i = 0; i < nE; i++) {
        mob e = new mob(10);
        if(Gamelevel ==2)
        e.level = 20;
        if(Gamelevel == 3)
        e.level = 30;
        mobs = (mob[])append(mobs,e);
    }
}

void mobRender() {
    for (int d = 0; d < mobs.length; d++) {
        if (mobs[d].live) {
            if(Gamelevel ==2)
            mobs[d].level = 20;
            if(Gamelevel == 3)
            mobs[d].level = 30;
            mobs[d].render();                    
        }
    }
}

void mobReaper() {
    int i = mobs.length - 1;
    while (i >= 0) {
        if (mobs[i].live == false) {   
            
        
          if (i == 0)      
            mobs = (mob[])subset(mobs,i+1);
          else {
                mob[] a = (mob[])subset(mobs,0,i);
                mob[] b = (mob[])subset(mobs,i+1);
                mobs   = (mob[])concat(a,b);
            }
        }
        i--;
    }
}

void gunReaper() {
    boolean guncheck = true;
    while (guncheck && (bullet.length > 0)) {
        int lastElement = bullet.length - 1;
        if (bullet[lastElement].live == false) {
            bullet = (gun[])shorten(bullet);
        }
        else {
            guncheck = false;
        }
    }
}



void keyPressed(){
    if (keyCode == UP) {
        helicopter.up=true;
    }
    //   break;
    if (keyCode == DOWN) {
        helicopter.down=true;
    }
    // break;
    if (keyCode == RIGHT) {
        helicopter.right=true;
    }
    // break;
    if (keyCode == LEFT) {
        helicopter.left=true;
    }
    if (key == 'f' || key == 'F') {
        gun s = new gun(helicopter.x,helicopter.y);
        bullet = (gun[])append(bullet,s);
        delay(20);
    }
    // break;
    
}


void keyReleased(){
    if (keyCode == UP) {
        helicopter.up=false;
    }
    //   break;
    if (keyCode == DOWN) {
        helicopter.down=false;
    }
    // break;
    if (keyCode == RIGHT) {
        helicopter.right=false;
    }
    // break;
    if (keyCode == LEFT) {
        helicopter.left=false;
    }
}
