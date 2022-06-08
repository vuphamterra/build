touch abc
echo `pwd` > /tmp/abc
echo "Configuring influx"
#influxd &
(sleep 30 && echo setting up user && influx setup -o test_org -b test-bucket -u influxdb -p influxdb --token prodToken --name mbProd -f &&  influx bucket create -n emr_dev -r 52w) & influxd
#sh
#influxd 
