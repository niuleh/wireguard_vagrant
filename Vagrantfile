Vagrant.configure("2") do |config|

    config.vm.provider "hyperv" do |hyperv|
        hyperv.enable_virtualization_extensions = true
    end

    config.vm.define "fw"  do |fw|
        fw.vm.box = "generic/debian12"
        fw.vm.synced_folder ".", "/vagrant", disabled: true
    end

    config.vm.define "dev" do |dev|
        dev.vm.box = "generic/debian12"
        dev.vm.synced_folder ".", "/vagrant", disabled: true
    end
end