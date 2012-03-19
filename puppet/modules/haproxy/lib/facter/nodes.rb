# Fact: nodes
#
# Purpose: extract ip addresses of rabbit cluster
#
#
if  FileTest.exists?("/vagrant/Vagrantfile")
  Facter.add("rabbitnodes") do
    setcode do
      # returns a list of hostnames with ip
      %x[grep rabbitmq-server /vagrant/Vagrantfile | grep -v "#" | cut -d "'" -f 2,4 | sed "s/'/\\ /g"]
    end
  end
end