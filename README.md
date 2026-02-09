# IBM MQ Tap for MacOS (Brew installer)
The repo provides 
- the IBM MQ Toolkit for MacOS as a Brew cask
- the MQ container inspector on MacOS as a Brew formula

## Create Tap
To register this repository as a tap, run the command

```
brew tap ibm-messaging/ibmmq
```

## IBM MQ Toolkit for MacOS
The IBM MQ Toolkit for MacOS cask is a simple wrapper for the publically delivered toolkit `.pkg` file.

### Version
The cask installs the publically available version of the toolkit `9.4.5.0`

### How do I install the cask?
Installing this cask means **you have accepted the license** at:
https://ibm.biz/mqdevmacclient

If you accept these license terms, then you may proceed with the install by running the command:

```
brew install ibm-messaging/ibmmq/mqdevtoolkit
```

If you do not accept these license terms then do not install. If you do not accept these license terms but have already installed, then uninstall the cask by following the uninstall instructions.   

### Post install - setting up your environment

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

### How do I uninstall the cask?

```
brew uninstall ibm-messaging/ibmmq/mqdevtoolkit
```


### How do I find upgrade for the cask?
Check for an update 

```
brew update
```

If an upgrade is available, then you can install it. 

```
brew upgrade ibm-messaging/ibmmq/mqdevtoolkit
```


### Where are the x86_64 binaries?:
If you are on a x86_64 MacOS then you will see the following warning on 
install.

```
NOTE: This release contains only ARM64 binaries.
```

The current toolkit is a binary built only for the ARM64 architecture. 
If you need to work with x86_64 MacOS then you will need to use the 9.4.3.0 binary.


## Delete Tap
To unregister this repository as a tap, run the command

```
brew untap ibm-messaging/ibmmq
```

## Formula for mqcontainerinspector
Installs a MQ container inspector on MacOS
See. https://github.com/ibm-messaging/mq-container-inspector

### Install MQ container inspector:
brew install ibm-messaging/ibmmq/mqcontainerinspector

### Verify the Installation:
mq-container-inspector version
