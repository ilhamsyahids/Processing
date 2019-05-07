import android.content.Intent;
import android.os.Bundle;


void onCreate(Bundle savedInstanceState) {
 super.onCreate(savedInstanceState); 
}


void setup() {
 size(displayWidth, displayHeight);
 orientation(PORTRAIT);
 background(0);
}


void draw () {
 textAlign(LEFT);
 int text_x = 0;
 int text_y = 100;

 
 textSize(32);
 text("Membuat Kotak", text_x, text_y);
 
 
 int kotak_x = 0;
 int kotak_y = 200;
 int kotak_panjang = 800;
 int kotak_tinggi = 300;
 
 
 rect(kotak_x, kotak_y, kotak_panjang, kotak_tinggi);
}
