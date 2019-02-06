#/bin/bash
#i=200000000000
while read line
do
	p_barcode=`echo $line | gawk -F, '{print $1}'`
	c_barcode=`echo $line | gawk -F, '{print $3}'`
	p_finger=`echo $line | gawk -F, '{print $2}'`
	c_finger=`echo $line | gawk -F, '{print $4}'`
#	find probes -name "*-${p_finger}_${p_barcode}.bmp" | xargs -I ^ cp ^ A/${p_barcode}_${p_finger}.bmp &> |tee -a a.log
	find c_barcode -name "*-${c_finger}_${c_barcode}.bmp" | xargs -I ^ cp ^ R/${c_barcode}_${c_finger}.bmp 2>&1 |tee -a r.log

#	echo $p_path
#	echo $c_path
	
#	p_finger1=$(($p_finger+21))
#i=$(($i+1))
#echo $i
#    ls lt-qingdao/A/$p_barcode/$p_finger.bmp 2>&1 | tee -a p_bmp
#    ls lt-qingdao/A/$p_barcode/$p_finger.mnt.json 2>&1 | tee -a p_mnt
#    ls lt-qingdao/R/$c_barcode/$c_finger.bmp 2>&1 | tee -a c_bmp
#cp lt-qingdao/A/$p_barcode/$p_finger.bmp probe_images/$i-${p_finger1}_${p_barcode}.bmp 2>&1 | tee -a p_bmp
#cp lt-qingdao/A/$p_barcode/$p_finger.mnt.json probe_images/$i-${p_finger1}_${p_barcode}.mnt.json 2>&1 | tee -a p_mnt
#cp lt-qingdao/R/$c_barcode/$c_finger.bmp target_images/$i-${c_finger}_${c_barcode}.bmp 2>&1 | tee -a c_bmp
done < $1
