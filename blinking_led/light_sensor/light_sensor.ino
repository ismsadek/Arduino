int light = 0; // store the current light value

void setup() {
    // put your setup code here, to run once:
    Serial.begin(9600); //configure serial to talk to computer
}

void loop() {
    // put your main code here, to run repeatedly:
    light = analogRead(A0); // read and save value from LDR
    
    //tell computer the light level
    if(light < 100) {
        Serial.println("It is pretty dark!");  
    }
    else if(light > 100 && light < 400) {
        Serial.println("It is average light!"); 
    }
    else {
        Serial.println("It is quite light!");  
    }
    delay(500); // don't spam the computer!
}
