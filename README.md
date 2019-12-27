# ulx3s-next186

Automated builds for ulx3s for all FPGA sizes.

# Usage

You just need to start make:

```
mkdir $HOME/fpga
cp /your/license/license.dat $HOME/fpga
export DIAMOND_MAC=00:11:22:33:44:55 # replace with your MAC
make build
```
make will output bit files in $HOME/dist

