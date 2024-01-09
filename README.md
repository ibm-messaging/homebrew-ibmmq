# IBM MQ Toolkit for MacOS (Brew installer)
This repo provides the IBM MQ Toolkit for MacOS as a Brew cask.
The cask is a simple wrapper for the publically delivered toolkit `.pkg` file.

## Version
The cask installs the publically available version of the toolkit `9.3.4.0`

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
brew install ibm-messaging/ibmmq/devtoolkit
```

If you do not accept these license terms then do not install. If you do not accept these license terms but have already installed, then uninstall the cask by following the uninstall instructions.   

## How do I uninstall the cask?

```
brew uninstall ibm-messaging/ibmmq/devtoolkit
```


## How do I find upgrade for the cask?
Check for an update 

```
brew update
```

If an upgrade is available, then you can install it. 

```
brew upgrade ibm-messaging/ibmmq/devtoolkit
```


## Delete Tap
To unregister this repository as a tap, run the command

```
brew untap ibm-messaging/ibmmq
```
