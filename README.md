### Infrastructure

| Nom    | OS           | IP            | Type    |
|--------|--------------|--------------|---------|
| bastion| ubuntu 22.04 | 192.168.6.120| N/A     |
| node1  | ubuntu 22.04 | 192.168.6.121| master  |
| node2  | ubuntu 22.04 | 192.168.6.122| master  |
| node3  | ubuntu 22.04 | 192.168.6.123| master  |
| node4  | ubuntu 22.04 | 192.168.6.124| worker  |
| node5  | ubuntu 22.04 | 192.168.6.125| worker  |

### Commands

```
vagrant up
vagrant ssh bastion
sudo -i
wget https://raw.githubusercontent.com/0xbochi/kubespray_config/main/kube_inventory.sh
chmod +x kube_inventory.sh
./kube_inventory.sh
ansible-playbook -i kubespray/inventory/sample/inventory.ini -u vagrant -k -b kubespray/cluster.yml
#Default password is vagrant
```

#### Troubleshooting

```
fatal: [node2]: FAILED! => ....

```
Use this command to fix it :
```
export ANSIBLE_HOST_KEY_CHECKING=False
```
and re-launch 
```
ansible-playbook -i kubespray/inventory/sample/inventory.ini -u vagrant -k -b kubespray/cluster.yml
```