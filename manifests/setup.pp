define sudo::setup($content) {
    if(!defined(File["/etc/sudoers.d/$name"])) {
        file { "/etc/sudoers.d/$name":
            owner   => "root",
            group   => "root",
            mode    => 440,
            content => $content
        }
    }
}
