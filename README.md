# MinecraftServerShManager - EndServ 

![GitHub license](https://img.shields.io/badge/license-GPL--3.0-%23fe7d37) ![GitHub last commit](https://img.shields.io/github/last-commit/EndMove/MinecraftServerShManager)

[![Donate][link-icon-coffee]][link-paypal-me] [![Website][link-icon-website]][link-website]

[link-icon-coffee]: https://img.shields.io/badge/%E2%98%95-Buy%20me%20a%20cup%20of%20coffee-991481.svg
[link-paypal-me]: https://www.paypal.me/EndMove/2.5eur
[link-icon-website]: https://img.shields.io/badge/%F0%9F%92%BB-My%20Web%20Site-0078D4.svg
[link-website]: https://www.endmove.eu/

MinecraftServerShManager, will allow you to host several minecraft servers on your machine and to navigate freely between their different consoles. Thanks to the simplified EndServ management script, you don't have to bother with a lot of useless commands, you just need to remember the name of your server!

## Getting Started
To get started you will need to install `screen`, `java` as well as `nano`, to do this follow the instructions below.

### Installing Dependencies
To perform updates if the system is not :
````sh
apt-get update && apt-get upgrade
````

Install Java, Screen, Nano (if you already have one of the packages remove it from the list).
````sh
apt-get install default-jdk screen nano
````
Warning, to be able to run `server.jar` you must have Java 8 at least (`apt-get install oracle-java8-installer`)

### Installing
For this installation the directory `~/home/minecraft/` will be the main directory where the minecraft servers will be stored.

````sh
# We go to the home directory and clone the repository
cd /home && git clone https://github.com/EndMove/MinecraftServerShManager

# We rename the file from the repository and go into it
mv MinecraftServerShManager minecraft && cd minecraft

````

### Create a Minecraft Server
Perform this process the number of times you need a minecraft server.

:warning: Don't forget to replace `server_name` with the name of your server.

````sh
# We copy the EndServ.sh file (to have one per server)
cp EndServ.sh server_name.sh
# We change permissions
chmod +x server_name.sh
# We chalk up the server's file and move in
mkdir server_name && cd server_name
# Let's chalk up Mojang's EULA file and validate it
touch eula.txt && echo "eula=true" >> eula.txt
````

Now you need to download the `.jar` Sigot, Vanilla, Sponge, ... you want to use as a server and put it in the server_name folder you just created. Once the downloaded `.jar` file renamed it to `server.jar` to do this you can use the command `mv file_name.jar server.jar`.  Once all these manipulations are done your architecture should look like this :
````
~/home/minecraft
    |-- .gitattributes
    |-- EndServ.sh
    |-- LICENSE
    |-- README.md
    |
    |----@ /demo
    |       |-- server.jar
    |       |-- eula.txt
    |-- demo.sh
    |
    |----@ /server_name
    |       |-- server.jar
    |       |-- eula.txt
    |-- server_name.sh
    |
    |----@ /(your other servers)
    |       |-- server.jar
    |       |-- eula.txt
    |-- (your other manager script).sh
````

Now you need to configure your `server_name.sh` file.
````sh
# We go back to the '~/home/minecraft' folder
cd ../
# We open your server's EndServ file with the nano editor
# Replace in the configuration settings at the top of the file, 'server_name' with the name of your server
# Use CTRL+O to save followed by CTRL+X followed by ENTER to exit
nano server_name.sh
````
Congratulations! Your configuration is complete use the command `cd /home/minecraft` to go to your management directory and the command `./server_name.sh help` to display the script parameters.

## Comment utiliser ?
After the installation is complete and a server is created, use this command to move to the EndServ scripts directory: `cd /home/minecraft`.
When you are in the directory you can access the controls of your server with this command: `./server_name.sh` this will display the help menu.

### EndServ commands
List of common EndServ commands :

- Start : `./server_name.sh start`
This command starts your minecraft server.

- Stop : `./server_name.sh stop`
Cette commande vous permet d'arrèter votre serveur minecraft.

- Status : `./server_name.sh status`
This command shows if your server is on or off.

- Screen : `./server_name.sh screen`
This command allows you to access the terminal of your minecraft server.

- Reload : `./server_name.sh reload`
This command reloads your minecraft server.

- Version : `./server_name.sh version`
This command gives you some information about the script you are currently using.

- Help : `./server_name.sh help`
This command displays the list of commands of the script.

### Demo server
A demo server has been made available before you can use its script don't forget to make it executable. Use this command in the `~/home/minecraft` directory to do this : `chmod +x demo.sh`. And start your demo server with the command `./demo.sh start`. (server in vanilla version 1.15.2).

## FAQ (Frequently Asked Questions)
Find below some answers to your questions !?

#### [FAQ 1°]: How do I exit the server console (screen) ?
To exit Screen use the keyboard shortcut : `CTRL + A + D`.

#### [FAQ 2°]: My server says the command `./server_name.sh` doesn't exist ?
Don't panic, check that you are in the sh EndServ script folder, if it is the case then the startup shortcut has been disabled on your server ... Run the script using the `sh server_name.sh` command instead of `./server_name.sh`.

#### [FAQ 3°]: My server tells me I don't have permission to run my EndServ script ?
Check that you are an administrator on your machine / vps. If it is not the case use the command `sudo ./server_name.sh` the server will ask you for the root password, indicate it. If you are the administrator in this case, maybe the permissions in your `server_name.sh` file are incorrect, use the command : `chmod 755 server_name.sh`.

#### [FAQ 4°]: The script says that my minecraft server starts but nothing works ?
In this case change the permissions of your minecraft server's folder by running this command : `chmod -R 775 server_name`. If after that your server still doesn't start check that you have correctly configured your EndServ script. You can always contact me at : `contact@endmove.eu` (French and English only).