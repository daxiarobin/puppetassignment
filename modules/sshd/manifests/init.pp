
class sshd {
   package { 'openssh-server':
     ensure => present,
     before => Service['sshd'],
   }

   file_line { 'change1':
        path  => '/etc/puppetlabs/code/environments/production/modules/sshd/files/sshd_config',
        line  => 'PasswordAuthentication yes',
        match => '^PasswordAuthentication\s+no',
   }

   file_line { 'change2':
        path  => '/etc/puppetlabs/code/environments/production/modules/sshd/files/sshd_config',
        line  => 'UsePAM yes',
        match => '^UsePAM\s+no',
   }   
  
   file_line { 'change3':
        path  => '/etc/puppetlabs/code/environments/production/modules/sshd/files/sshd_config',
        line  => '#PermitRootLogin yes',
        match => '^PermitRootLogin yes',
   }

   service { 'sshd':
     ensure   => running,
     enable   => true,
     require  => Package['openssh-server'],
     subscribe => File['/etc/ssh/sshd_config'],
   }

   file { '/etc/ssh/sshd_config':
    ensure  => file,
    source  => 'puppet:///modules/sshd/sshd_config',
    require => Package['openssh-server'],
    notify => Service['sshd'],
   }

   
}

