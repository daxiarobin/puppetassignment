class installpackages {
  $packagelist = [ 'openssh','openssh-server','openssh-clients','strace' ]
  
  package { $packagelist:
     ensure => installed,
  }

  service { 'sshd':
     ensure => running,
     enable => true,
     require => Package['openssh-server'],
     subscribe => File['/etc/init.d/sshd'],
     
  }
  
  file {'/etc/init.d/sshd':
    ensure => file,
    owner => root,
    group => root,
    mode => '0755',

  }


}
