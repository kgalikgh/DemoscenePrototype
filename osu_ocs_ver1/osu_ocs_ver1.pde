int circleRadius = 10;
final int CIRC_COUNT = 8;
final int BPL_NUM = 3;


class circleOsu {
  int x,y;
  int r;
  circleOsu(int _x, int _y, int _r) {
    x = _x;
    y = _y;
    r = _r;
  }
  
  void drawInnerCircle(int k) {
    for(int i = 0; i < k; i++) {
      bpl[i].circleE(x,y,r);
      bpl[i].fill();
    }
  }
  
  void drawOuterCircle(int offset) {
    bpl[1].circle(x,y, r + offset);
  }
}

circleOsu circles[];
circleOsu mirror[];
//320 = 10 +    + 10
//optymalne współrzędne kółek: (110,64), (110,192), (210, 64), (210, 192)

//320 x 256


void drawLine(circleOsu c1, circleOsu c2, int k) {
  for(int i = 0; i < k; i++) {
    bpl[i].line(c1.x, c1.y, c2.x, c2.y);
  }
  
}


void setup() {
  size(320, 256);
  frameRate(25);
  initOCS(3);
  //randomSeed(0);
  palette[1] = rgb12(color(0xff,0,0));
  palette[3] = rgb12(color(0,0xff,0));
  palette[7] = rgb12(color(0,0,0xff));
  palette[2] = rgb12(color(0xff, 0xff, 0xff));
  circles = new circleOsu[CIRC_COUNT];
  mirror = new circleOsu[CIRC_COUNT];
  
  
  for(int i = 0; i < CIRC_COUNT; i++)
  {
    circles[i] = new circleOsu(int(random(40, 120)), int(random(32, 224)), 10);
  }
  
  for(int i = 0; i < CIRC_COUNT; i++)
  {
    mirror[i] = new circleOsu(320 - circles[i].x, circles[i].y, 10);
  }
  
  
}

int circ = 0;
int lineCounter = 0;
int actualLineNum = 0;

void draw() {
  circleRadius = 15 - frameCount % 16;
  for(int i = 0; i < BPL_NUM; i++)
    bpl[i].zeros();
  int k = (2*frameCount+1) % 3 + 1; 
  
  
  circles[circ].drawInnerCircle(k);
  mirror[circ].drawInnerCircle(3-k);
  
  if(circleRadius > 0) {
    circles[(circ > 0) ? circ-1 : CIRC_COUNT -1].drawOuterCircle((7-circleRadius));
    circles[circ].drawOuterCircle(circleRadius);
    mirror[(circ > 0) ? circ-1 : CIRC_COUNT -1].drawOuterCircle((7-circleRadius));
    mirror[circ].drawOuterCircle(circleRadius);
  }
    
  else {
    circles[circ].drawOuterCircle(2*circleRadius);
    mirror[circ].drawOuterCircle(2*circleRadius);
    lineCounter = 15;
    actualLineNum = circ;
  }
  
  
  if(lineCounter > 0) {
    drawLine(circles[(actualLineNum > 0) ? actualLineNum - 1  : CIRC_COUNT - 1], circles[(actualLineNum) % CIRC_COUNT], k);
    drawLine(circles[actualLineNum], circles[(actualLineNum + 1) % CIRC_COUNT], k);
    drawLine(mirror[(actualLineNum > 0) ? actualLineNum - 1  : CIRC_COUNT - 1], mirror[(actualLineNum) % CIRC_COUNT], k);
    drawLine(mirror[actualLineNum], mirror[(actualLineNum + 1) % CIRC_COUNT], 3-k);
    lineCounter--;
  }
  
  
  if(circleRadius == 0) {
    circ++;
    if(circ >= CIRC_COUNT) circ = 0;
  }
  
  
  updateOCS();
}
