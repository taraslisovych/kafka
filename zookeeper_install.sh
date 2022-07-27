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
mv kafka_2.12-3.2.0 zookeeper

sudo chmod +x /etc/init.d/zookeeper
sudo chown root:root /etc/init.d/zookeeper
sudo update-rc.d zookeeper defaults

# sudo vi /etc/hosts

mkdir /home/ubuntu/zookeeper/data

echo "1" > /home/ubuntu/zookeeper/data/myid
echo "2" > /home/ubuntu/zookeeper/data/myid
echo "3" > /home/ubuntu/zookeeper/data/myid

rm /home/ubuntu/zookeeper/config/zookeeper.properties

vi /home/ubuntu/zookeeper/config/zookeeper.properties

"""
# the directory where the snapshot is stored.
dataDir=/home/ubuntu/zookeeper/data
# the port at which the clients will connect
clientPort=2181
# setting number of connections to unlimited
maxClientCnxns=0
# keeps a hearbeat of zookeeper in milliseconds
tickTime=2000
# time for inital synchronization
initLimit=10
# how many ticks can pass before timeout
syncLimit=5
# define servers ip and internal ports to zookeeper
server.1=zookeeper1:2888:3888
server.2=zookeeper2:2888:3888
server.3=zookeeper3:2888:3888
"""


sudo service zookeeper start
