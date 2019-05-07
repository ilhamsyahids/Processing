import android.content.Intent;
import android.os.Bundle;
import ketai.net.bluetooth.*;
import ketai.ui.*;

KetaiBluetooth bt;
KetaiList klist;
boolean isConfiguring;
String currentDeviceConnected = "";
String receivedData = "";
byte [] dataOn = {'0'};
byte [] dataOff = {'1'};

void setup() {
 size(displayWidth, displayHeight);
 orientation(PORTRAIT);
 background(0);
 bt.start();
 isConfiguring = true;
}

void onCreate(Bundle savedInstanceState) {
  super.onCreate(savedInstanceState);
  bt = new KetaiBluetooth(this);
}

void draw() {
 if (isConfiguring) {
  background(0); 
  klist = new KetaiList(this, bt.getPairedDeviceNames());
  isConfiguring = false;
 } else {
  background(150,150,150);
  textAlign(LEFT);
  textSize(32);
  text("Connected to " + currentDeviceConnected, 100, 50);
  text(receivedData, 100, 150);
  
  int tombol_kirim_x1 = 50;
  int tombol_kirim_y1 = 100;
  int tombol_kirim_panjang1 = 150;
  int tombol_kirim_tinggi1 = 50;
  
  int tombol_kirim_x2 = 50;
  int tombol_kirim_y2 = 200;
  int tombol_kirim_panjang2 = 150;
  int tombol_kirim_tinggi2 = 50;
  
  fill(255,0,0);
  rect(tombol_kirim_x1, tombol_kirim_y1, tombol_kirim_panjang1, tombol_kirim_tinggi1);
  fill(0,0,255);
  rect(tombol_kirim_x2, tombol_kirim_y2, tombol_kirim_panjang2, tombol_kirim_tinggi2);
  
  if (mousePressed) {
   if (mouseX >=  tombol_kirim_x1 && mouseX <= (tombol_kirim_x1+tombol_kirim_panjang1)
       && mouseY >= tombol_kirim_y1 && mouseY <= (tombol_kirim_y1+tombol_kirim_tinggi1)) {
    bt.writeToDeviceName(currentDeviceConnected, dataOn);
   } else if (mouseX >=  tombol_kirim_x2 && mouseX <= (tombol_kirim_x2+tombol_kirim_panjang2)
       && mouseY >= tombol_kirim_y2 && mouseY <= (tombol_kirim_y2+tombol_kirim_tinggi2)) {
    bt.writeToDeviceName(currentDeviceConnected, dataOff);    
   }
  }
 }
}

void onKetaiListSelection(KetaiList klist) {
 String selection = klist.getSelection();
 bt.connectToDeviceByName(selection);
 currentDeviceConnected = selection;
 klist = null;
}

void onBluetoothDataEvent(String who, byte[] data) {
 if (isConfiguring) {
  return; 
 }
 receivedData = new String(data);
}
