cat << EOF >> ~/.ssh/config

Host $(hostname)
    Hostname $(hostname)
    User $(user)
    Identityfile $(identityfile)
EOF