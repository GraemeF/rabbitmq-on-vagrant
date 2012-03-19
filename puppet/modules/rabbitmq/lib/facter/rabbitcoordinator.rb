# Fact: rabbitcoordinator

#
# Purpose: Configure Rabbitmq node to run in standalone or clustered mode.
# Returns: standalone or <cluster_coordinators_hostname> 
#
#
if  FileTest.exists?("/vagrant/Vagrantfile")
  Facter.add("rabbitcoordinator") do
    setcode do
      # returns name of the first rabbit node
      %x[grep rabbitmq-server /vagrant/Vagrantfile | grep -v "#" | cut -d "'" -f 2 | sed "s/'/\\ /g" | awk '{print($1)}' | tr -d [:blank:] | head -1 | tr -d [:cntrl:]]
    end
  end
end