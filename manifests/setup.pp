define sudo::setup($content) {
    notify { "$name" : }
    if(!defined(File["/etc/sudoers.d/$name"])) {
        file { "/etc/sudoers.d/$name":
            owner   => "root",
            group   => "root",
            mode    => 440,
            content => $content
        }
    }
}
