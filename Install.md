## Local Setup Instructions

If you want to run the bootcamp locally, run the following instructions below for your particular situation.
Note that we include a custom javascript file for Jupyter, so if you already have Jupyter installed, you still need to install the custom.js file.

Note: Make sure you are using **Java 8** (NOT Java 9) and have the JDK8 installed. Coursier/jupyter-scala does not appear to be compatible with Java 9 yet as of January 2018.

If you do have multiple version of Java, make sure to select Java 8 (1.8) before running `jupyter notebook`:

* On Windows: https://gist.github.com/rwunsch/d157d5fe09e9f7cdc858cec58c8462d6
* On Mac OS: https://stackoverflow.com/questions/21964709/how-to-set-or-change-the-default-java-jdk-version-on-os-x

### Local Installation - Mac/Linux

This bootcamp uses Jupyter notebooks.
Jupyter notebooks allow you to interactively run code in your browser.
It supports multiple programming languages.
For this bootcamp, we'll install jupyter first and then the Scala-specific jupyter backend (now called almond).


#### Jupyter
First install Jupyter.

Dependencies: openssh-client, openjdk-8-jre, openjdk-8-jdk (-headless OK for both),  ca-certificates-java

First, use pip3 to install jupyter (or pip for python 2): http://jupyter.org/install.html
```
pip3 install --upgrade pip
pip3 install jupyter --ignore-installed
```

If pip3 isn't working out of the box (possibly because your Python3 version is out of date), you can try `python3 -m pip` in lieu of `pip3`.

(To reinstall jupyter later for whatever reason, you can use `--no-deps` to avoid re-installing all the dependencies.)

You may want to try out Jupyter lab, the newer interface developed by Project Jupyter.
It is especially useful if you want to be able to run a terminal emulator in your browser.
It can be installed with `pip3`:
```
pip3 install jupyterlab
```

#### Jupyter Backend for Scala

If you experience errors or issues with this section, try running `rm -rf ~/.local/share/jupyter/kernels/scala/` first.

Next, download coursier and use it to install almond (see [here](https://almond.sh/docs/quick-start-install) for the source for these instructions):
```
curl -L -o coursier https://git.io/coursier-cli && chmod +x coursier
SCALA_VERSION=2.12.10 ALMOND_VERSION=0.9.1
./coursier bootstrap -r jitpack \
    -i user -I user:sh.almond:scala-kernel-api_$SCALA_VERSION:$ALMOND_VERSION \
    sh.almond:scala-kernel_$SCALA_VERSION:$ALMOND_VERSION \
    --sources --default=true \
    -o almond
./almond --install
```

You can delete `coursier` and `almond` files if you so desire.

#### Install bootcamp
Now clone the bootcamp repo and install the customization script.
If you already have one, append this script to it.

```
git clone https://github.com/navaneeth93/chisel-miniproject.git
cd chisel-rebootcamp
```

And to start the bootcamp on your local machine:
```
jupyter notebook
```

If you installed Jupyter Lab, run `jupyter-lab` instead.


### Local Installation - Windows

These notes describe, in general, the way to install the Generator Bootcamp under Windows 10.
Many different Windows configurations may be encountered and some changes may be required.
Please let us know of there are things out of date, or should otherwise be covered here.

>There are several times where you may want to launch a Command (shell) window.
I have discovered that launching the command window in Administrator Mode is helpful.
To do that from the bottom left Launcher, find or search for 'CMD' when selecting it from
the menu, right click and choose, "Launch in Administrator Mode".
Find more details on this [here](http://www.thewindowsclub.com/how-to-run-command-prompt-as-an-administrator)
and other places.
It is also best to relauch any command windows between steps in the process (e.g. after installing Java)
so that any newly installed software will be recognized.

#### Be sure Java is installed (ideally Java 8).
If you type `java` into a command prompt and it says command not found, you need to install
[Java](https://adoptopenjdk.net/installation.html).

#### Install Jupyter
Jupyter recommends using the Anaconda distribution, here is the
[Windows download](https://www.anaconda.com/download/#windows).

Near the end of the Jupyter installation is a question about whether to add Jupyter to the PATH.
Windows does not recommend this, but I do.  It will make it easier to run using the command prompt.

If you did not elect to add Jupyter to the PATH, start a prompt using the
"Anaconda Prompt (Anaconda3)" shortcut from the Start Menu.

#### Install Scala components.

The simplest way seems to be to download Coursier from [here](https://github.com/coursier/coursier/releases/download/v2.0.0-RC6-24/coursier).

Go to download folder, where `coursier` (file) is

```
java -noverify -jar coursier launch --fork almond:0.10.6 --scala 2.12.8 -- --install
```

#### Install the chisel-bootcamp repo.
Download the [chisel-miniproject](https://github.com/navaneeth93/chisel-miniproject) as a zip file (or use a Windows git client)
and unpack it in a directory you have access to.
Ideally, you should put it in a path that has no spaces.

#### Launch the Jupyter and the bootcamp
In the directory containing the unpacked chisel-miniproject repo, from a new command window type:
```bash
jupyter notebook
```
This should start the miniproject server and open a top page miniproject menu in your default browser.  If it does not
look for the something like the following in the command window and copy and paste the link you see into
a browser window.
```bash
    Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://localhost:8888/?token=9c503729c379fcb3c7a17087f05462c733c1733eb8b31d07
```
