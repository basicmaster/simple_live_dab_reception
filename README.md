# Simple live DAB reception

A (DVB-T) USB stick with the famous Realtek RTL2832U chipset is needed.

Just a simple script that installs:
- DABlin (`next` branch)
- eti-cmdline (for RTLSDR sticks)

Tested with Ubuntu MATE 17.10.

## Usage

Open a console window (press Ctrl+Alt+T) and just paste/type:

    wget -O - https://github.com/basicmaster/simple_live_dab_reception/raw/master/simple_dab_live.sh | bash -x

Note that you will be asked for your root password in order to install
packages and the software itself.

After installation, you can call DABlin after the next login with just:

    dablin_calling

To limit the amount of displayed channels in the channel list, you can
edit the file `~/bin/dablin_calling` and append something like e.g.
` -C 5C,11C,11D` at the line end of the `dablin_gtk` command.
