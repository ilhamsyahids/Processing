import android.content.Intent;
import android.os.Bundle;
import ketai.net.bluetooth.*;
import ketai.ui.*;

KetaiBluetooth bt;
KetaiList klist;
boolean isConfiguring;
String currentDeviceConnected = "";
String receivedData = "";

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
