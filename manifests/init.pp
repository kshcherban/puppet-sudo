class sudo(
    $filename = undef
) {
    if (!$filename) {
        $hash = hiera_hash("sudo_files", undef)
        if (!$hash) {
            notify { "sudo is searching for sudo_files hash": }
        } else {
            create_resources(sudo::setup, $hash)
        }
    } else {
        file {"/etc/sudoers.d/$filename":
            owner   => "root",
            group   => "root",
            mode    => 440,
            source  => "puppet:///modules/sudo/$filename"
        }
    }
    file {"/etc/sudoers":
        owner   => "root",
        group   => "root",
        mode    => 440,
        source  => "puppet:///modules/sudo/default"
    }
}

