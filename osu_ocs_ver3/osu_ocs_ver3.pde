final int CIRC_RADIUS = 12;
final int CIRC_COUNT = 5;
final int BPL_NUM = 4;

circleOsu circles[];
circleOsu mirror[];


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
    bpl[1].circle(x,y, r + offset);
  }
}

void drawLine(circleOsu c1, circleOsu c2) {
    bpl[1].line(c1.x, c1.y, c2.x, c2.y);
}


void setup() {
  size(320, 256);
  frameRate(25);
  initOCS(BPL_NUM);
  
  circles = new circleOsu[CIRC_COUNT];
  mirror = new circleOsu[CIRC_COUNT];
  
  
  for(int i = 0; i < CIRC_COUNT; i++)
  {
    circles[i] = new circleOsu(90 + (-1 * (i%2)) * (16 * i), i * 48 + 24, CIRC_RADIUS); 
  }
  
  
  for(int i = 0; i < CIRC_COUNT; i++)
  {
    mirror[i] = new circleOsu(320 - circles[i].x, circles[i].y, CIRC_RADIUS);
  }

  palette[1] = rgb12(color(0x64,0,0));
  palette[3] = rgb12(color(0x8a,0,0));
  palette[7] = rgb12(color(0xbf,0,0));
  palette[15] = rgb12(color(0xff,0,0));
  palette[2] = rgb12(color(0x7f, 0x7f, 0x7f));
  
  copper(0, 37, 1, color(0, 0, 0x64)); 
  copper(8, 37,3, color(0, 0, 0x8a));
  copper(16, 37, 7, color(0, 0, 0xbf));
  copper(24, 37, 15, color(0, 0, 0xff));
  
  copper(0, 85, 1, color(0, 0x64, 0));
  copper(8, 85,3, color(0, 0x8a, 0));
  copper(16, 85, 7, color(0, 0xbf, 0));
  copper(24, 85, 15, color(0, 0xff, 0));
  
  copper(0, 133, 1, color(0, 0x64, 0x64));
  copper(8, 133, 3, color(0, 0x8a, 0x8a));
  copper(16, 133, 7, color(0, 0xbf, 0xbf));
  copper(24, 133, 15, color(0, 0xff, 0xff));
  
  copper(0, 181, 1, color(0x64,0 , 0x64));
  copper(8, 181, 3, color(0x8a,0, 0x8a));
  copper(16, 181, 7, color(0xbf,0, 0xbf));
  copper(24, 181, 15, color(0xff,0, 0xff));
  
}

int circ = 0;
int lineCounter = 0;
int actualLineNum = 0;

void draw() {
  int outerCircleRadius = 7 - frameCount % 8;
  for(int i = 0; i < BPL_NUM; i++)
    bpl[i].zeros();
  int mod = frameCount % 8;
  int k = 4;
  if(mod < 7)
    k = 3;
  if(mod < 5)
    k = 2;
  if(mod < 1)
    k = 1;

  circles[CIRC_COUNT - circ - 1].drawInnerCircle(k);
  mirror[circ].drawInnerCircle(k); 
  
  for(int i = 0; i < k; i++)
    bpl[i].fill();
  
  if(outerCircleRadius > 0) {
    for(int i = 0; i < CIRC_COUNT; i++) {
        circles[i].drawOuterCircle(12-outerCircleRadius);
        circles[i].drawOuterCircle(3-outerCircleRadius/4);
        mirror[i].drawOuterCircle(12-outerCircleRadius);
        mirror[i].drawOuterCircle(3-outerCircleRadius/4);
    }
  }
  
  
  if(outerCircleRadius == 0) {
    circ++;
    if(circ >= CIRC_COUNT) {
      circ = 0;
    }
    
    
  }
  
  
  updateOCS();
}
