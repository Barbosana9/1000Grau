int pinoSensor = A5;
int valorLindo = 0;
float temperatura = 0;

void setup() {
    Serial.begin(9600);
}

void loop() {
  valorLindo = analogRead(pinoSensor);
  temperatura = (valorLindo * 0.00488);
  temperatura = temperatura * 100;
  Serial.println(temperatura);
 
  delay(500);

}
