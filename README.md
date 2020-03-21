# MinecraftServerShManager - EndServ 

![GitHub license](https://img.shields.io/badge/license-GPL--3.0-%23fe7d37) ![GitHub last commit](https://img.shields.io/github/last-commit/EndMove/MinecraftServerShManager)
MinecraftServerShManager, will allow you to host several minecraft servers on your machine and to navigate freely between their different consoles. Thanks to the simplified EndServ management script, you don't have to bother with a lot of useless commands, you just need to remember the name of your server!

## Getting Started
To get started you will need to install `screen`, `java` as well as `nano`, to do this follow the instructions below.

### Installing Dependencies
To perform updates if the system is not:
````sh
apt-get update && apt-get upgrade
````

Install Java, Screen, Nano (if you already have one of the packages remove it from the list)
````sh
apt-get install default-jdk screen nano
````

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
# We chalk up the server's file and move in.
mkdir server_name && cd server_name
# On craie le fichier EULA de Mojang et on le valide
touch eula.txt && echo "eula=true" >> eula.txt
````

Now you need to download the `.jar` Sigot, Vanilla, Sponge, ... you want to use as a server and put it in the server_name folder you just created. Once the downloaded `.jar` file renamed it to `server.jar` to do this you can use the command `mv file_name.jar server.jar`.  Once all these manipulations are done your architecture should look like this:
````
~/home/minecraft
    |-- .gitattributes
    |-- EndServ.sh
    |-- LICENSE
    |-- README.md
    |
    |----@ /server_name
    |       |-- server.jar
    |       |-- eula.txt
    |-- server_name.sh
    |
    |----@ /(your other servers)
````

Il faut maintenant configurer votre fichier `server_name.sh`.
````sh
# We go back to the '~/home/minecraft' folder.
cd ../
# We open your server's EndServ file with the nano editor.
# Replace in the configuration settings at the top of the file, 'server_name' with the name of your server.
# Use CTRL+O to save followed by CTRL+X followed by ENTER to exit.
nano server_name.sh
````
Congratulations! Your configuration is complete use the command `cd /home/minecraft` to go to your management directory and the command `./server_name.sh help` to display the script parameters.