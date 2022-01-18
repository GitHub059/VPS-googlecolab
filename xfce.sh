apt update; apt upgrade; 
echo instalando o ngrok;
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1;
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1;
./ngrok authtoken 23o7Blb79YJhsxhQM0s3JvPcCbb_4npfySab6kus3MpsjhYmE;
echo **instalando o xfce4 e outros pacotes**
apt install xfce4 xfce4-taskmanager firefox xfce4-terminal tightvncserver
export USER=root
vncserver :1 -geometry 1280x720
./ngrok tcp 5901
echo seu ip:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
