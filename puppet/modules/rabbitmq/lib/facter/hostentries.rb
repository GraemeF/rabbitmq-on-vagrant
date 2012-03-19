# Fact: hostentries
#
# Purpose: extract /etc/hosts file entries for rabbit cluster
#
#
if  FileTest.exists?("/vagrant/Vagrantfile")
  Facter.add("hostentries") do
    setcode do
      # returns a list of hostnames with ip
      %x[grep rabbitmq-server /vagrant/Vagrantfile | grep -v "#" | cut -d "'" -f 4,2 | sed "s/'/\\ /g" | awk '{print($2,$1)}']
    end
  end
end