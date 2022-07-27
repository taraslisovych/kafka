sudo dd if=/dev/zero of=/extraswap bs=1M count=1024
sudo chmod 600 /extraswap
sudo mkswap /extraswap
sudo swapon /extraswap
sudo vi /etc/fstab

"""
/extraswap swap swap defaults 0 0
"""



sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y install openjdk-8-jdk-headless

wget https://dlcdn.apache.org/kafka/3.2.0/kafka_2.12-3.2.0.tgz
tar -xzvf kafka_2.12-3.2.0.tgz
mv kafka_2.12-3.2.0 kafka

sudo chmod +x /etc/init.d/kafka
sudo chown root:root /etc/init.d/kafka
sudo update-rc.d kafka defaults

# sudo vi /etc/hosts

mkdir /home/ubuntu/kafka/data

rm /home/ubuntu/kafka/config/server.properties

vi /home/ubuntu/kafka/config/server.properties

"""
# change this for each broker
broker.id=[broker_number]
# change this to the hostname of each broker
advertised.listeners=PLAINTEXT://[hostname]:9092
# The ability to delete topics
delete.topic.enable=true
# Where logs are stored
log.dirs=/home/ubuntu/kafka/data
# default number of partitions
num.partitions=8
# default replica count based on the number of brokers
default.replication.factor=3
# to protect yourself against broker failure
min.insync.replicas=2
# logs will be deleted after how many hours
log.retention.hours=168
# size of the log files
log.segment.bytes=1073741824
# check to see if any data needs to be deleted
log.retention.check.interval.ms=300000
# location of all zookeeper instances and kafka directory
zookeeper.connect=zookeeper1:2181,zookeeper2:2181,zookeeper3:2181/kafka
# timeout for connecting with zookeeeper
zookeeper.connection.timeout.ms=6000
# automatically create topics
auto.create.topics.enable=true
"""


sudo service kafka start
