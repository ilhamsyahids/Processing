import processing.serial.*;
Serial bluetooth;
Serial arduino;

char received_data;

void setup()
{
  bluetooth = new Serial(this, "COM8", 9600); // sesuaikan COMnya
  
  arduino = new Serial(this, "COM7", 9600); // sesuaikan COMnya
  
  size(400,300);
  
  fill(0,0,255);
}

void draw()
{
  while(bluetooth.available() > 0)
  {
    received_data = bluetooth.readChar();
    println("Data Masuk = " + received_data);
    arduino.write(received_data);
    if(received_data == '0')
    {
      fill(255,0,0);
      println("0");
    }
    else if(received_data == '1')
    {
      fill(0,0,255);
      println("1");
    }
  }
  rect(50,100,100,50);
}
