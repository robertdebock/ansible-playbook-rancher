Vagrant.configure("2") do |config|
  config.vm.define "node0" do |node0|
    node0.vm.box = "fedora/32-cloud-base"
    node0.vm.synced_folder '.', '/vagrant', disabled: true
    node0.vm.provider :libvirt do |domain|
      domain.memory = 1536
      domain.cpus = 1
    end
  end
  config.vm.define "node1" do |node1|
    node1.vm.box = "fedora/32-cloud-base"
    node1.vm.synced_folder '.', '/vagrant', disabled: true
    node1.vm.provider :libvirt do |domain|
      domain.memory = 6144
      domain.cpus = 2
    end
  end
  config.vm.define "node2" do |node2|
    node2.vm.box = "fedora/32-cloud-base"
    node2.vm.synced_folder '.', '/vagrant', disabled: true
    node2.vm.provider :libvirt do |domain|
      domain.memory = 6144
      domain.cpus = 2
    end
  end
end
