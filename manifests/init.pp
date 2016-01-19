class sudo(
    $filename = undef
) {
    if (!$filename) {
        $hash = hiera("sudo_files", undef)
        if (!$hash) {
#            notify { "sudo is searching for sudo_files hash": }
        } else {
            file {"/etc/sudoers.d/users":
                owner   => "root",
                group   => "root",
                mode    => '0440',
                content  => "$hash"
            }
        }
    } else {
        file {"/etc/sudoers.d/$filename":
            owner   => "root",
            group   => "root",
            mode    => '0440',
            source  => "puppet:///modules/sudo/$filename"
        }
    }
    file {"/etc/sudoers":
        owner   => "root",
        group   => "root",
        mode    => '0440',
        source  => "puppet:///modules/sudo/default"
    }
}

