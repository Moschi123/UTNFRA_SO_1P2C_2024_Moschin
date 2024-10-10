cat << EOF > ~/repogit/UTNFRA_SO_1P2C_2024_Moschin/RTA_ARCHIVOS_Examen_20241010/Filtro_Basico.txt

Total de Memoria RAM: $(grep -i "memtotal" /proc/meminfo)

Fabricante del Chasis: $(sudo dmidecode -t chassis | grep -i "manufacturer")

EOF

