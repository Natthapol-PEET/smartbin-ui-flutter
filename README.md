# smartbin_ui_flutter

sudo apt update -y
sudo apt full-upgrade -y

sudo apt install chromium-browser -y
cd /tmp
curl -sSfLO http://archive.raspberrypi.org/debian/pool/main/b/bluealsa/bluealsa_0.13_armhf.deb
apt install ./bluealsa_0.13_armhf.deb
rm bluealsa_0.13_armhf.deb

chromium-browser

export DISPLAY=192.168.0.5:0.0
chromium-browser -start-maximized
chromium-browser --kiosk --app=localhost:8080

sudo apt-get remove chromium-browser
sudo apt-get autoremove -y
sudo apt-get install chromium-browser -y

sudo apt update && sudo apt full-upgrade

<!-- sudo apt purge --autoremove chromium-browser -y
sudo apt install chromium -y -->

cd /tmp

curl -sSfLO https://archive.raspberrypi.org/debian/pool/main/c/chromium-browser/chromium-browser_92.0.4515.98-rpt1_armhf.deb

curl -sSfLO https://archive.raspberrypi.org/debian/pool/main/c/chromium-browser/chromium-codecs-ffmpeg-extra_92.0.4515.98-rpt1_armhf.deb

sudo apt install ./chromium-{browser,codecs-ffmpeg-extra}_92.0.4515.98-rpt1_armhf.deb

rm chromium-*





<!-- pi chrome -->
sudo apt purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y

sudo apt purge smartsim java-common minecraft-pi libreoffice* -y

sudo apt clean
sudo apt autoremove -y

sudo apt update -y
sudo apt upgrade -y

sudo apt install xdotool unclutter sed -y

sudo raspi-config

nano ~/kiosk.sh

#!/bin/bash
xset s noblank
xset s off
xset -dpms
unclutter -idle 0.5 -root &
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/$USER/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/$USER/.config/chromium/Default/Preferences
/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk https://pimylifeup.com https://www.adafruit.com &

while true; do
         xdotool keydown ctrl+Next; xdotool keyup ctrl+Next;
      sleep 15
done


chmod u+x ~/kiosk.sh

echo $DISPLAY

sudo nano /lib/systemd/system/kiosk.service

[Unit]
Description=Chromium Kiosk
Wants=graphical.target
After=graphical.target

[Service]
Environment=DISPLAY=:0.0
Environment=XAUTHORITY=/home/pi/.Xauthority
Type=simple
ExecStart=/bin/bash /home/pi/kiosk.sh
Restart=on-abort
User=pi
Group=pi

[Install]
WantedBy=graphical.target


sudo systemctl enable kiosk.service

sudo systemctl start kiosk.service
sudo systemctl status kiosk.service
sudo systemctl stop kiosk.service

sudo systemctl disable kiosk.service



https://app.netlify.com/sites/delicate-chaja-4f6e1e/deploys/64d0da882be4dd66a9df54ac

