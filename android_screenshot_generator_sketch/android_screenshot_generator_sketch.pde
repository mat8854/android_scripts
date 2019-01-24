

// images
PImage imgInput;
PImage imgBackground;

// size of generated screenshots
int w = 608;
int h = 1080;

void setup()
{
  // size of background image image (1920:1080)
  // same height for output as portrait
  size(608, 1080);
}


void draw()
{
  // generate three screenshots
  screen_store("/assets/in1_en_framed.png","Ice Cream", "BUY NOW", "/assets/andromeda_full_hd.jpg", 0, "/out/out1_en.jpeg", color(#7CB342));
  screen_store("/assets/in2_en_framed.png","Ice Cream 2x", "BUY NOW", "/assets/andromeda_full_hd.jpg", 1, "/out/out2_en.jpeg", color(#7CB342));
  screen_store("/assets/in3_en_framed.png","Family Discount", "BUY NOW", "/assets/andromeda_full_hd.jpg", 2, "/out/out3_en.jpeg", color(#7CB342));

  noLoop();
  println("finished");
}

// lots of hard coded numbers for now
void screen_store(String file_input, String text_top, String text_bottom,  String file_bg, int tile, String file, int col)
{
  imgBackground = loadImage(file_bg); 
  imgBackground.resize(0, 1080);
  
  PImage imgTile = imgBackground.get(tile * 608, 0, 608, 1080);
  // background image should be gray scale
  imgTile.filter(GRAY);
  
  // set background
  image(imgTile, 0, 0);
  
  imgInput = loadImage(file_input); 
  imgInput.resize(460, 0);
  // center image on background (manual offseting)
  image(imgInput, (608 - imgInput.width) / 2 , (1080 - imgInput.height + 25) / 2);
 
  // place top rect
  stroke(col);
  fill(col);
  rect(0, 0, w, 100);
 
  // place top text
  stroke(color(#ffffff));
  fill(color(#ffffff));
  textSize(50);
  textAlign(CENTER, CENTER);
  text(text_top, w/2, 40);
 
  // place bottom rect
  stroke(col);
  fill(col);
  rect(0, h - 100, w, 100);
 
  // place bottom text
  stroke(color(#FFFFFF));
  fill(color(#FFFFFF));
  textSize(60);
  textAlign(CENTER, CENTER);
  text(text_bottom, w/2, h - 60);
  
  save(file);
}
