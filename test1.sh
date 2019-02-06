#/bin/bash
i=200000000000
while read line
do
#    p_barcode=`echo $line | gawk -F, '{print $1}'`
    c_barcode=`echo $line | gawk -F, '{print $1}'`
#    p_finger=`echo $line | gawk -F, '{print $2}'`
    c_finger=`echo $line | gawk -F, '{print $2}'`
#    p_finger1=$(($p_finger+21))
    i=$(($i+1))
#    echo $i
#    ls lt-qingdao/A/$p_barcode/$p_finger.bmp 2>&1 | tee -a p_bmp
#    ls lt-qingdao/A/$p_barcode/$p_finger.mnt.json 2>&1 | tee -a p_mnt
#    ls lt-qingdao/R/$c_barcode/$c_finger.bmp 2>&1 | tee -a c_bmp
#cp lt-qingdao/A/$p_barcode/$p_finger.bmp probe_images/$i-${p_finger1}_${p_barcode}.bmp 2>&1 | tee -a p_bmp
#cp lt-qingdao/A/$p_barcode/$p_finger.mnt.json probe_images/$i-${p_finger1}_${p_barcode}.mnt.json 2>&1 | tee -a p_mnt
    cp lt-qingdao/R/$c_barcode/$c_finger.bmp target_images/$i-${c_finger}_${c_barcode}.bmp 2>&1 | tee -a c_bmp
done < $1
