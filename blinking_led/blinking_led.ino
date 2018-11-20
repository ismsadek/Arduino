void setup() {
    // put your setup code here, to run once:
    pinMode(13, OUTPUT); // configure the pin as an output
}

void loop() {
    // put your main code here, to run repeatedly:
    digitalWrite(13, HIGH); // turn LED on
    delay(1000); // wait 1 second
    digitalWrite(13, LOW); // turn LED off
    delay(1000); // wait one second
}
