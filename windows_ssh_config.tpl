Set-Content -Path "~/.ssh/config" -Value @"
Host ec2-remote-dev-env
    HostName ${hostname}
    User ${user}
    IdentityFile ${identityfile}
"@