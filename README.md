## GSWL_TP1_User_Management

This project contains a service that converts xls file to csv and verifies whether the number of users in the csv file tally with the number of users on the local machine. If new users are added to the xls file(usersinfo.xls), the service will automatically creates the missing users in the local machine.

Note that this service can also be used on a server.

# Installation

1. The first step to use this project is to clone its repository. This is done by entering the following command:
   `git clone https://github.com/MohammadZaheer/GSWL_TP1_User_Management.git`
   
2. The second step is to execute the script install.sh. But before doing that, it is mandatory to give the script install.sh the necessary permission to be able to execute it. This is done by entering the following command: 
`chmod u+x install.sh`
Then to execute the install.sh file, enter the following command
`./install.sh`

# xls folder

This folder contains a .xls file which is usersinfo.xls which contains a list of usernames.

Note that the xls file can be edited as per user requirements.

# retrive.sh

In this script, DIR is being used to get the full directory name of the script no matter where it is being called from.

It also uses xls2csv, which is a script that recodes a spreadsheet's charset which in our case is .xls file.

The line `xls2csv $DIR/GSWL_TP1_User_Management/xls/usersinfo.xls > $DIR/GSWL_TP1_User_Management/csv/usersinfo.csv` is used to specify the path where the .xls file is located and also to specifies where to put the csv file.

# install folder

This folder contains the file install.sh which install the all the prerequisites for this project.

The commands `sudo apt-get update -y` and `sudo apt-get install -y xlsx2csv` respectively is used to update the system and then install xls2csv.

The command `sudo apt install catdoc` is used to install a text extractor called catdoc which is useful when extracting MS-Office files.

The commands `cd ..`, `cd src`, `cp retrieve.service ../../etc/systemd/system` and `cd ../../etc/systemd/system` respectively are used to copy the service found in the src folder of the project to the directory /etc/systemd/system and navigates to that directory

The command `chmod u+x retrieve.service` is used to give permission to the user to execute the service

The commands `sudo su`, `./retrieve.service` and `exit` respectively are used to enter root mode, executes the service and exit the root mode

The command `sudo systemctl enable retrieve` is used to enable the service.

The command `sudo systemctl start retrieve` is used to start the service.

# How to manage services

To start service:
```
sudo systemctl start name_of_service
```

To stop service:
``` 
sudo systemctl stop name_of_service
```

To restart service:
```
sudo systemctl restart name_of_service
```

To check the status of service:
```
sudo systemctl status name_of_service
```

To enable service:
```
sudo systemctl enable name_of_service
```

To disable service:
```
sudo systemctl disable name_of_service
```

### `systemctl enable` and `systemctl start`

`systemctl enable` configures the system to start the service at next reboot.

`systemctl start` starts (activates) the service immediately.

So if you want a service to start now and on every reboot then you need to both `enable` and `start` the service.
