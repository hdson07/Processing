class Background {
    PImage background;
    
    Background () {
        background = loadImage("Background.jpg");
        
    }
    
    void render() {
        image(background,0,0);
    }
}
