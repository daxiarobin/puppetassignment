class installsudo {
    $packagelist = [ 'sudo' ]

    package { $packagelist:
       ensure => present,
    }
}
