# How to use this ?

After create your customrole.xml in services directory 
```shell
vim /usr/lib/firewalld/services/customrole.xml
```
execute reload firewall 
```shell
firewall-cmd --reload
```
now apply the new role (with permanent flag):
```shell
firewall-cmd --add-service=customrole --permanent
```

# How to view all services ?
you can use this command to view this :
```shell
firewall-cmd --get-services
```

