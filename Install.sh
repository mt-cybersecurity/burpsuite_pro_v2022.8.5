#!/bin/bash

  # Download Burp Suite Profesional Latest Version
    echo 'Downloading Burp Suite Professional v2022.8.5 ....'
    Link="https://portswigger-cdn.net/burp/releases/download?product=pro&version=2022.8.5&type=Jar"
    wget "$Link" -O burpsuite_pro_v2022.8.5.jar --quiet --show-progress
    sleep 2s

  # Execute Key Generator
    echo 'Starting Keygenerator'
    (java -jar keygen.jar) &
    sleep 3s
    
  # Execute Burp Suite Professional with Keyloader
    echo 'Executing Burp Suite Professional with Keyloader'
    echo "java --illegal-access=permit -Dfile.encoding=utf-8 -javaagent:$(pwd)/loader.jar -noverify -jar $(pwd)/burpsuite_pro_v2022.8.5.jar &" > Burp
    chmod +x Burp
    cp Burp /bin/Burp 
    (./Burp)
else
    echo "Execute Command as Root User"
exit
