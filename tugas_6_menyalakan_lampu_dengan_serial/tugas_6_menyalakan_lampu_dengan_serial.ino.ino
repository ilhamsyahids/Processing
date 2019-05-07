int ledPin = 2;
int ledState = LOW;
int serial_baud_rate = 9600;
int data;

void setup() {
  pinMode(ledPin, OUTPUT);
  Serial.begin(serial_baud_rate);
}

void loop() {
  if(Serial.available() > 0)
  {
    data = Serial.read();
    if(data == 48)
    {
      digitalWrite(ledPin, HIGH);
    }
    else if (data == 49)
    {
      digitalWrite(ledPin, LOW);
    }
  }
}
