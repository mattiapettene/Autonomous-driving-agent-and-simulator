# Autonomous driving agent and simulator
In this repository there is the autonomous driving agent developed during the "Intelligent vehicles and autonomous driving" course. This agent will be tested using a minimal driving simulator, useful for both high and low level control in the field of self-driving cars.


### Istructions to set python simulator

In the terminal, run the following commands:

sudo apt install gcc <br>
sudo apt install g++ <br>
sudo apt install clang <br>
sudo apt install clang++ <br>
sudo apt install cmake <br>
sudo apt install gdb <br>

#### To run the visualizator on Windows10 using wsl:

- Install XLaunch and set "Disable access control", then save this configuration in %AppData%\Microsoft\Windows\Start Menu\Programs\Startup folder to avoid to open XLaunch each time

- The next step is to set the DISPLAY environment variable on Linux to use the Windows host's IP address. In the terminal run: <br>
  export DISPLAY="`grep nameserver /etc/resolv.conf | sed 's/nameserver //'`:0" 

- Running the following command, it is possible to see that the $DISPLAY environment variable now has the Windows Host’s IP set: <br>
  echo $DISPLAY

- To avoid having to run that command every time that WSL is launched, you can include the command at the end of the /etc/bash.bashrc file, running: <br>
  nano ~/.bashrc or gedit ~/.bashrc

- It is also necessary to create a .xsession file in the user's home directory: <br>
  echo xfce4-session > ~/.xsession

- Finally run: sudo apt-get update
