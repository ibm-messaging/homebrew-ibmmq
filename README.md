# IBM MQ Toolkit for MacOS (Brew installer)
This repo provides the IBM MQ Toolkit for MacOS as a Brew cask.
The cask is a simple wrapper for the publically delivered toolkit `.pkg` file.


## Version
The cask installs the publically available version of the toolkit `9.4.1.0`

## Create Tap
To register this repository as a tap, run the command

```
brew tap ibm-messaging/ibmmq
```

## How do I install the cask?
Installing this cask means **you have accepted the license** at:
https://ibm.biz/mqdevmacclient

If you accept these license terms, then you may proceed with the install by running the command:

```
brew install ibm-messaging/ibmmq/mqdevtoolkit
```

If you do not accept these license terms then do not install. If you do not accept these license terms but have already installed, then uninstall the cask by following the uninstall instructions.   

## Post install - setting up your environment

To make it easier to use the devtoolkit, you might want to:

add the `/opt/mqm/bin` directory to your `PATH` environment variable e.g.,:

```
export PATH=/opt/mqm/bin:$PATH
```

add locations of the bin directories `/opt/mqm/bin` and `/opt/mqm/samp/bin` to the PATH by editing `/etc/paths`

set the `DYLD_LIBRARY_PATH` e.g.,:

```
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/opt/mqm/lib64
```

## How do I uninstall the cask?

```
brew uninstall ibm-messaging/ibmmq/mqdevtoolkit
```


## How do I find upgrade for the cask?
Check for an update 

```
brew update
```

If an upgrade is available, then you can install it. 

```
brew upgrade ibm-messaging/ibmmq/mqdevtoolkit
```

## What's the other cask?
The eagle eyed of you will notice that there is a second cask `devtoolkit`. We changed the name to `mqdevtoolkit` to make it stand out when you run the command `brew list`. If you have the cask with the old name installed, remove it by running the command

```
brew uninstall ibm-messaging/ibmmq/devtoolkit
```

We will remove the old cask in a later release to allow you to migrate to the new cask.

## Delete Tap
To unregister this repository as a tap, run the command

```
brew untap ibm-messaging/ibmmq
```
