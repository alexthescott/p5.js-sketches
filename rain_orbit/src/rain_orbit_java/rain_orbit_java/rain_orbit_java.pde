// alexthescott 7/7/21
// HD remake of my Pico8 rain_orbit tweetcart 
// https://twitter.com/mralexthescott/status/1412208513569333248

float[][] circles = new float[6][2];
int[][] palette = {{255,255,255},{255,236,39},{255,163,0},{255,0,77},{190,18,80},{126,37,83},
           {17,29,53},{29,43,83},{18,83,89},{6,90,181},{41,173,255},{194,195,199}};
           
void setup(){
 size(400, 400);
 background(0,0,25);
  for (int i=6; i>0; i--){
    circles[6-i][0]=0.0;
    circles[6-i][1]=i/(TWO_PI*8);
  }
}

void draw(){
  noStroke();
  fill(0,0,25,10);
  rect(0,0,width,height);
  noFill();
  stroke(255);
  ellipse(width/2,height/2,width-10,height-10);
  noStroke();
  for (int i=1; i<7; i++){
    float x = width/2 + i*28 * (sin(circles[i-1][0]));
    float y = height/2 + i*28 * (-cos(circles[i-1][0]));
    fill(palette[i-1][0], palette[i-1][1], palette[i-1][2],128);
    circle(x,y,28);
    fill(palette[5+i][0], palette[5+i][1], palette[5+i][2],128);
    circle(-x+width,y,28);
    circles[i-1][0]+=circles[i-1][1];
  }
}
