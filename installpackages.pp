class installpackages {
  $packagelist = [ 'openssh','openssh-server','openssh-clients','strace' ]
  
  package { $packagelist:
     ensure => installed,
  }

  service { 'sshd':
     ensure => running,
     enable => true,
     require => Package['openssh-server'],
     
  }
  
   file { 'sshdconfig':
        name => '/etc/ssh/sshd_config',
        owner => root,
        group => root,
        mode => '644',
        source => 'puppet:///modules/sshd/sshd_config',
        require => Package['openssh-server'],
   }


}
