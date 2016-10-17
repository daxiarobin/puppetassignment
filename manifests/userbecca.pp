class userbecca {
  user { 'becca':
    ensure => present,
    groups => ['sysadmin','cars'],
    uid => '10011371',
    gid => 'sysadmin',
    password => '$1$x.UibzmN$KgqenkOz9/SNEYOE6c/.R1',
    password_max_age => '99999',
    password_min_age => '0',
    home => '/home/becca',
    shell => '/bin/bash',
  }

  group { 'cars':
    ensure => present,
  }

  group { 'sysadmin':
    ensure => present,
  }

  file { '/home/becca':
    ensure => 'directory',
   
  }
  

}

