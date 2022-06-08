#Azure  - Ports to enable
	443, 22, 7117, 9092


# Running QEMU with Public Cloud VM
	Add /etc/hosts --> 52.250.7.136 sudks-emr-ui.internal.cloudapp.net


sudo apt-get install docker.io docker-compose



# UI Code
/opt/emr
git clone https://github.com/EMRSpartans/emr
cd /opt/emr/emr/UI/emr-webapp-master/emr-webapp-master
install nodejs 12
npm install
sudo npm install pm2 -g
pm2 start app.js
	admin/Spartans@123$


# OpenEMR
cd /opt/emr/emr/thirdparty/OpenEmr
docker-compose -f openemr-compose.yml up -d
	admin/pass
	# Issues - 
	


# OpenEMR Phpmyadmin - mariadb


# Kafka
	apt-get install default-jdk -- this was mostly oracle java but default is also fine
	sudo useradd kafka -m
	sudo passwd kafka  # Spartans@123
	sudo adduser kafka sudo
	su -l kafka
	mkdir Downloads
	cd Downloads
	wget "https://www.apache.org/dist/kafka/2.5.0/kafka_2.13-2.5.0.tgz"
	mkdir ~/kafka && cd ~/kafka
	tar -xvzf ~/Downloads/kafka_2.13-2.5.0.tgz
	mv /home/kafka/kafka/kafka_2.13-2.5.0/* /home/kafka/kafka/
	vi ~/kafka/config/server.properties
		delete.topic.enable = true
	sudo vi /etc/systemd/system/zookeeper.service
		[Unit]
		Requires=network.target remote-fs.target
		After=network.target remote-fs.target

		[Service]
		Type=simple
		User=kafka
		ExecStart=/home/kafka/kafka/bin/zookeeper-server-start.sh /home/kafka/kafka/config/zookeeper.properties
		ExecStop=/home/kafka/kafka/bin/zookeeper-server-stop.sh
		Restart=on-abnormal

		[Install]
		WantedBy=multi-user.target
	sudo vi /etc/systemd/system/kafka.service
		[Unit]
		Requires=zookeeper.service
		After=zookeeper.service

		[Service]
		Type=simple
		User=kafka
		ExecStart=/bin/sh -c '/home/kafka/kafka/bin/kafka-server-start.sh /home/kafka/kafka/config/server.properties > /home/kafka/kafka/kafka.log 2>&1'
		ExecStop=/home/kafka/kafka/bin/kafka-server-stop.sh
		Restart=on-abnormal

		[Install]
		WantedBy=multi-user.target
		
	sudo systemctl start kafka
	sudo journalctl -u kafka
	sudo systemctl enable kafka
	

# Kafka Topics
	~/kafka/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic ecg
	~/kafka/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic MyBigData 
	~/kafka/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic Temp


# Kafka UI
	sudo ufw allow 9000
	# this can be under kafka user or other user
	git clone https://github.com/obsidiandynamics/kafdrop.git
	docker run --restart=always -it --add-host kafka:0.0.0.0 -d -p 9000:9000 -e KAFKA_BROKERCONNECT=your_local_IP:9092 -e JVM_OPTS="-Xms32M -Xmx64M" -e SERVER_SERVLET_CONTEXTPATH="/" obsidiandynamics/kafdrop

# Influxdb
	sudo apt-get install influxdb
	sudo apt-get install influxdb-client.
	influx
	# Database Information
		CREATE DATABASE "vector-database"
		CREATE RETENTION POLICY "a_year" ON "vector-database" DURATION 52w REPLICATION 1
	# Database Import
		influx
			drop database "vector-database"
		sudo service influxdb stop
		cd ~/sudks/influxdb/backup/
		sudo influxd restore -metadir /var/lib/influxdb/meta ./oct4_2020 
		sudo influxd restore -database vector-database -datadir /var/lib/influxdb/data ./
		cd /var/lib/influxdb
		sudo chown -R influxdb ./
		sudo chgrp -R influxdb ./
		sudo service influxdb start
		influx
		ALTER RETENTION POLICY "vec-retention" on "vector-database" DURATION 54w REPLICATION 1


# Vector
curl --proto '=https' --tlsv1.2 -sSf https://sh.vector.dev | sh
sudo systemctl start vector



# SSH Tunnels Configurations


# Extras
	sudo apt-get install python-pip
	pip install ExportCsvToInflux
	export_csv_to_influx \
--csv floorsitting.csv \
--dbname "vector-database" \
--measurement  "ecg.vector" \
--tag_columns url \
--field_columns response_time \
--force_insert_even_csv_no_update True \
--server 127.0.0.1:8086

