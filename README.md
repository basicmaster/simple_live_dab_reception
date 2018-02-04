# Simple live DAB reception

Just a simple script that installs:
- DABlin (`next` branch)
- eti-cmdline (for RTLSDR sticks)

Tested with Ubuntu MATE 17.10.

## Usage

Open a console window (press Ctrl+Alt+T) and just type:

    wget -O - https://raw.githubusercontent.com/basicmaster/simple_live_dab_reception/master/simple_dab_live.sh | bash -x

Note that root rights will be required to install packages and the
software itself.

After installation, you can call DABlin after the next login with just:

    dablin_calling

To limit the amount of displayed channels, you can edit the file
`~/bin/dablin_calling` and append something like e.g. ` -C 5C,11C,11D`.
