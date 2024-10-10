cat << EOF > ~/repogit/UTNFRA_SO_1P2C_2024_Moschin/RTA_ARCHIVOS_Examen_20241010/Filtro_Basico.txt

Dirección IP Pública: $(curl -s ifconfig.me)

Nombre de usuario: $(whoami)

Hash de contraseña del usuario vagrant: $(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')

EOF

