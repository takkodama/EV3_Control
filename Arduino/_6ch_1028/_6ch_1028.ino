const int NUMLEDS = 14;
byte pin[NUMLEDS] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14};
byte state[NUMLEDS] = {LOW, LOW, LOW, LOW, LOW, LOW, LOW, LOW, LOW, LOW, LOW, LOW};
int interval[NUMLEDS] = {300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300};
int FREQ_strong = 365;
int FREQ_small = 240;
int FREQ_big = 40;

unsigned long tone_big = 25000; // tone_ = 1000/Frequency × 1000
unsigned long tone_small = 4166; // tone_ = 1000/Frequency × 1000
unsigned long tone_strong = 2740; // tone_ = 1000/Frequency × 1000

unsigned long tone_strong_high = 5000; // tone_ = 1000/Frequency × 1000

byte outCHN = NUMLEDS + 1;

void setup() {
  //while(!SerialUSB.available());
  //SerialUSB.begin(9600);
  Serial.begin(9600);

  for (int i = 0; i < NUMLEDS; ++i) {
    pinMode(pin[i], OUTPUT);
    digitalWrite(pin[i], HIGH);
  }
}

void loop() {

//  if (SerialUSB.available() > 0) {
//    SerialUSB.print("I received: "); // 受信データを送りかえす
//    outCHN = SerialUSB.read();
//  }

  if (Serial.available() > 0) {
    Serial.print("I received: "); // 受信データを送りかえす
    outCHN = Serial.read();
  }

  switch (outCHN) {
    case 0:
      digitalWrite(pin[3], HIGH);
      delayMicroseconds(tone_big / 2);
      digitalWrite(pin[3], LOW);
      delayMicroseconds(tone_big / 2);
      break;
    case 1:
      digitalWrite(pin[4], HIGH);
      delayMicroseconds(tone_big / 2);
      digitalWrite(pin[4], LOW);
      delayMicroseconds(tone_big / 2);
      break;
    case 2:
      digitalWrite(pin[5], HIGH);
      digitalWrite(pin[6], HIGH);
      delayMicroseconds(tone_big / 2);
      digitalWrite(pin[5], LOW);
      digitalWrite(pin[6], LOW);
      delayMicroseconds(tone_big / 2);
      break;
    case 3:
      digitalWrite(pin[7], HIGH);
      digitalWrite(pin[8], HIGH);
      delayMicroseconds(tone_big / 2);
      digitalWrite(pin[7], LOW);
      digitalWrite(pin[8], LOW);
      delayMicroseconds(tone_big / 2);
      break;
    case 4:
      digitalWrite(pin[9], HIGH);
      delayMicroseconds(tone_big / 2);
      digitalWrite(pin[9], LOW);
      delayMicroseconds(tone_big / 2);
      break;
    case 5:
      digitalWrite(pin[10], HIGH);
      delayMicroseconds(tone_big/ 2);
      digitalWrite(pin[10], LOW);
      delayMicroseconds(tone_big / 2);

      break;
    default:
      for (int i = 0; i < NUMLEDS; i++) {
        digitalWrite(pin[i], LOW);
      }
  }


  /* -----
  tone(pin[13], 50, interval[13]);
  delay(1000);
  */

  /* -----
  tone(pin[10], FREQ_small, interval[10]);
  delay(1000);
  */
}


