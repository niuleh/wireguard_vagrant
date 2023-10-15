Vagrant.configure("2") do |config|

    config.trigger.before :up do |trigger|
        trigger.info = "Creating 'NATSwitch' Hyper-V switch if it does not exist..."
        trigger.run = 
            { privileged: "true", 
              powershell_elevated_interactive: "true", 
              path: "./scripts/create-nat-hyperv-switch.ps1" }
        # trigger.run = 
        #     { privileged: "true", 
        #       powershell_elevated_interactive: "true", 
        #       path: "./scripts/create-lan-hyperv-switch.ps1" }        
    end

    config.vm.define "fw"  do |fw|
        fw.vm.box = "generic/debian12"
        fw.vm.hostname = "fw"
        fw.vm.synced_folder ".", "/vagrant", disabled: true
        fw.vm.provider "hyperv" do |hyperv|
            hyperv.vmname = "fw"
            hyperv.cpus = 1
            hyperv.maxmemory = 1024
            hyperv.memory = 512
        end

        fw.trigger.after :reload do |trigger|
            trigger.info = "Setting Hyper-V switch to 'NATSwitch' to allow for static IP..."
        
            trigger.run = 
                { privileged: "true", 
                  powershell_elevated_interactive: "true", 
                  path: "./scripts/configure-fw-vm-nics.ps1" }
        end

        fw.vm.provision "shell", path: "./scripts/configure-fw-guest-ips.sh"
        fw.vm.provision :reload

    end

    # config.vm.define "dev" do |dev|
    #     dev.vm.box = "generic/debian12"
    #     dev.vm.hostname = "dev"
    #     dev.vm.synced_folder ".", "/vagrant", disabled: true
    #     dev.vm.provider "hyperv" do |hyperv|
    #         hyperv.vmname = "dev"
    #         hyperv.cpus = 2
    #         hyperv.maxmemory = 1024
    #         hyperv.memory = 512
    #     end
    # end
end