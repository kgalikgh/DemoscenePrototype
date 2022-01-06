final int CIRC_RADIUS = 12;
final int CIRC_COUNT = 8;
final int BPL_NUM = 4;


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
      bpl[i].circleE(x,y,r - 3*i);
    }
  }
  
  void drawOuterCircle(int offset) {
    bpl[4].circle(x,y, r + offset);
  }
}

circleOsu circles[];
circleOsu mirror[];

void drawLine(circleOsu c1, circleOsu c2) {
    bpl[1].line(c1.x, c1.y, c2.x, c2.y);
}


void setup() {
  size(320, 256);
  frameRate(25);
  initOCS(BPL_NUM + 1);
  //randomSeed(0);
  
  circles = new circleOsu[CIRC_COUNT];
  mirror = new circleOsu[CIRC_COUNT];
  
  
  for(int i = 0; i < CIRC_COUNT; i++)
  {
    circles[i] = new circleOsu(int(random(16, 100)), i * 32 + 16, CIRC_RADIUS); 
  }
  
  for(int i = 0; i < CIRC_COUNT; i++)
  {
    mirror[i] = new circleOsu(320 - circles[i].x, circles[i].y, CIRC_RADIUS);
  }
  
  //16 + 24 + 16 = 56  
  
  palette[1] = rgb12(color(0x64,0,0));
  palette[3] = rgb12(color(0x8a,0,0));
  palette[7] = rgb12(color(0xbf,0,0));
  palette[15] = rgb12(color(0xff,0,0));
  
  palette[0x10] = rgb12(color(0x7f, 0x7f, 0x7f));
  palette[0x11] = rgb12(color(0x64,0,0));
  palette[0x13] = rgb12(color(0x8a,0,0));
  palette[0x17] = rgb12(color(0xbf,0,0));
  palette[0x1f] = rgb12(color(0xff,0,0));
  
  
  palette[2] = rgb12(color(0x7f, 0x7f, 0x7f));
  
  copper(0, 29, 1, color(0, 0, 0x64));
  copper(8, 29,3, color(0, 0, 0x8a));
  copper(16, 29, 7, color(0, 0, 0xbf));
  copper(24, 29, 15, color(0, 0, 0xff));
  
  copper(32, 29, 0x11, color(0, 0, 0x64));
  copper(40, 29, 0x13, color(0, 0, 0x8a));
  copper(48, 29, 0x17, color(0, 0, 0xbf));
  copper(56, 29, 0x1f, color(0, 0, 0xff));
  
  
  copper(0, 61, 1, color(0, 0x64, 0));
  copper(8, 61,3, color(0, 0x8a, 0));
  copper(16, 61, 7, color(0, 0xbf, 0));
  copper(24, 61, 15, color(0, 0xff, 0));
  
  copper(32, 61, 0x11, color(0, 0x64, 0));
  copper(40, 61,0x13, color(0, 0x8a, 0));
  copper(48, 61, 0x17, color(0, 0xbf, 0));
  copper(56, 61, 0x1f, color(0, 0xff, 0));
 
  
  copper(0, 93, 1, color(0, 0x64, 0x64));
  copper(8, 93, 3, color(0, 0x8a, 0x8a));
  copper(16, 93, 7, color(0, 0xbf, 0xbf));
  copper(24, 93, 15, color(0, 0xff, 0xff));
  
  copper(32, 93, 0x11, color(0, 0x64, 0x64));
  copper(40, 93, 0x13, color(0, 0x8a, 0x8a));
  copper(48, 93, 0x17, color(0, 0xbf, 0xbf));
  copper(56, 93, 0x1f, color(0, 0xff, 0xff));
  
  
  
  copper(0, 125, 1, color(0x64,0 , 0x64));
  copper(8, 125, 3, color(0x8a,0, 0x8a));
  copper(16, 125, 7, color(0xbf,0, 0xbf));
  copper(24, 125, 15, color(0xff,0, 0xff));
  
  copper(32, 125, 0x11, color(0x64,0 , 0x64));
  copper(40, 125, 0x13, color(0x8a,0, 0x8a));
  copper(48, 125, 0x17, color(0xbf,0, 0xbf));
  copper(56, 125, 0x1f, color(0xff,0, 0xff));
  
  
  
  copper(0, 157, 1, color(0x64, 0x64, 0));
  copper(8, 157, 3, color(0x8a, 0x8a, 0));
  copper(16, 157, 7, color(0xbf, 0xbf, 0));
  copper(24, 157, 15, color(0xff, 0xff, 0));
  
  copper(32, 157, 0x11, color(0x64, 0x64, 0));
  copper(40, 157, 0x13, color(0x8a, 0x8a, 0));
  copper(48, 157, 0x17, color(0xbf, 0xbf, 0));
  copper(56, 157, 0x1f, color(0xff, 0xff, 0));
  
  
  copper(0, 189, 1, color(0x64, 0x3f, 0x64));
  copper(8, 189, 3, color(0x8a, 0x3f, 0x8a));
  copper(16, 189, 7, color(0xbf,0x3f, 0xbf));
  copper(24, 189, 15, color(0xff,0x3f, 0xff));
  
  copper(32, 189, 0x11, color(0x64, 0x3f, 0x64));
  copper(40, 189, 0x13, color(0x8a, 0x3f, 0x8a));
  copper(48, 189, 0x17, color(0xbf,0x3f, 0xbf));
  copper(56, 189, 0x1f, color(0xff,0x3f, 0xff));
  
  
  copper(0, 221, 1, color(0x64, 0x64, 0x3f));
  copper(8, 221, 3, color(0x8a, 0x8a, 0x3f));
  copper(16, 221, 7, color(0xbf,0xbf, 0x3f));
  copper(24, 221, 15, color(0xff,0xff, 0x3f));
  
  copper(32, 221, 0x11, color(0x64, 0x64, 0x3f));
  copper(40, 221, 0x13, color(0x8a, 0x8a, 0x3f));
  copper(48, 221, 0x17, color(0xbf,0xbf, 0x3f));
  copper(56, 221, 0x1f, color(0xff,0xff, 0x3f));
  
}

int circ = 0;
int lineCounter = 0;
int actualLineNum = 0;
//final int 


void draw() {
  int outerCircleRadius = 7 - frameCount % 8;
  for(int i = 0; i < BPL_NUM+1; i++)
    bpl[i].zeros();
  int mod = frameCount % 8; //0 1 1 1 1 2 2 3
  int k = 4;
  if(mod < 7)
    k = 3;
  if(mod < 5)
    k = 2;
  if(mod < 1)
    k = 1;
  
  
  circles[circ].drawInnerCircle(k);
  mirror[circ].drawInnerCircle(k);
  
  for(int i = 0; i < k; i++)
    bpl[i].fill();
  
  if(outerCircleRadius > 2) {
    circles[circ].drawOuterCircle(outerCircleRadius/2);
    mirror[circ].drawOuterCircle(outerCircleRadius/2);
    bpl[4].fill();
    //bpl[1].fill();
    
  }
    
  else {
    circles[circ].drawOuterCircle(2*outerCircleRadius);
    mirror[circ].drawOuterCircle(2*outerCircleRadius);
  }
  
  
  if(lineCounter > 0) {
    //drawLine(circles[(actualLineNum > 0) ? actualLineNum - 1  : CIRC_COUNT - 1], circles[(actualLineNum) % CIRC_COUNT]);
    //drawLine(circles[actualLineNum], circles[(actualLineNum + 1) % CIRC_COUNT]);
    //drawLine(mirror[(actualLineNum > 0) ? actualLineNum - 1  : CIRC_COUNT - 1], mirror[(actualLineNum) % CIRC_COUNT]);
    //drawLine(mirror[actualLineNum], mirror[(actualLineNum + 1) % CIRC_COUNT]);
    
    //lineCounter--;
  }
  
  
  if(outerCircleRadius == 0) {
    circ++;
    if(circ >= CIRC_COUNT) circ = 0;
  }
  
  
  updateOCS();
}
