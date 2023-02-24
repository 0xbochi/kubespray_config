echo "INVENTORY SETUP"
while [ ! -f kubespray/inventory/sample/inventory.ini ]
do
    echo "NO FILE FOUND in"
    echo "kubespray/inventory/sample/inventory.ini"
    sleep 5
done
    echo "DOING THE PARSING"
    sed -i '/^\[all\]/a node1 ansible_host=192.168.6.121 ip=192.168.6.121 etcd_member_name=etcd1\nnode2 ansible_host=192.168.6.122 ip=192.168.6.122 etcd_member_name=etcd2\nnode3 ansible_host=192.168.6.123 ip=192.168.6.123 etcd_member_name=etcd3\nnode4 ansible_host=192.168.6.124 ip=192.168.6.124\nnode5 ansible_host=192.168.6.125 ip=192.168.6.125' kubespray/inventory/sample/inventory.ini
    sed -i '/^\[kube_control_plane\]/,+3 s/^#//' kubespray/inventory/sample/inventory.ini
    sed -i '/^\[etcd\]/,+3 s/^#//' kubespray/inventory/sample/inventory.ini
    sed -i '/^\[kube_node\]/,+5 {/node[45]/ s/^#//}' kubespray/inventory/sample/inventory.ini
    echo -e "\n[privilege_escalation]\nbecome = True\nbecome_method = sudo\nbecome_user = root\nbecome_ask_pass=False" | sudo tee -a kubespray/ansible.cfg
    echo "ansible-playbook -i inventory/sample/inventory.ini -u vagrant -k -b kubespray/cluster.yml"