wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "cole sua chave ngrok, copie e cole e pressione enter: " CRP
./ngrok authtoken $CRP 
nohup ./ngrok tcp 5900 --region sa &>/dev/null &
echo instalando depedencias aguarde...
sudo apt update -y > /dev/null 2>&1
echo instalando o qemu, em seguida vem o win...
sudo apt install qemu-system-i386 curl -y > /dev/null 2>&1
echo cole seu ip no vncviw... somente depois que "completado" :
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo WIN10 está a ser instalado, aguarde... !
wget https://software-download.microsoft.com/pr/Win10_21H2_BrazilianPortuguese_x32.iso?t=e44c09d4-fb0a-4450-9e77-2699abb2e4db&e=1642520246&h=67fb007af3817b91ac92e8a9119847ce
qemu-img create -f hd.img 35G
sudo qemu-system-i386 -vnc :0 -cdrom Win10_21H2_BrazilianPortuguese_x32.iso -hda hd.img -smp 2 -accel tcg,thread=multi -m 4G -cpu n270 -vga std -monitor stdio-machine usb=on -device usb-tablet > /dev/null 2>&1
echo completo, pode colocar no vnc ^-^
