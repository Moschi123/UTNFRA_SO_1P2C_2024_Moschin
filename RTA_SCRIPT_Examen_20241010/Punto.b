sudo fdisk /dev/sdc << EOF
n
p
1

+1G
w
EOF

# Crear la segunda partición primaria
sudo fdisk /dev/sdc << EOF
n
p
2

+1G
w
EOF

# Crear la tercera partición primaria
sudo fdisk /dev/sdc << EOF
n
p
3

+1G
w
EOF

# Crear la cuarta partición primaria (convertir a extendida para más particiones)
sudo fdisk /dev/sdc << EOF
n
e
4


w
EOF

# Crear particiones lógicas dentro de la extendida
sudo fdisk /dev/sdc << EOF
n

+1G
w
EOF

sudo fdisk /dev/sdc << EOF
n

+1G
w
EOF

sudo fdisk /dev/sdc << EOF
n

+1G
w
EOF

sudo fdisk /dev/sdc << EOF
n

+1G
w
EOF

sudo fdisk /dev/sdc << EOF
n

+1G
w
EOF

sudo fdisk /dev/sdc << EOF
n

+1G
w
EOF

# Formatear todas las particiones en ext4
for i in {1..10}; do
    sudo mkfs.ext4 /dev/sdc${i}
done

# Añadir particiones al archivo /etc/fstab y montar
echo "/dev/sdc5 /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc6 /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc7 /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab

echo "/dev/sdc8 /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc9 /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc10 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab

# Montar particiones
sudo mount -a
