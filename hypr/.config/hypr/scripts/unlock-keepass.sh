#!/bin/bash

# Give KWallet a second to fully initialize its D-Bus service after login
sleep 2

# Fetch the password from KWallet and pipe it directly into KeePassXC
kwallet-query -r keepassxc_master kdewallet | keepassxc --pw-stdin ~/.local/share/KeePassXC/Passwords.kdbx
