class mysql {
  $packagelist = [ 'mysql-community-server','mysql-community-client' ]
  
  package { $packagelist:
    ensure => present,

  }
  
  service { 'mysqld':
    ensure => running,
    enable => true,
    require => Package['mysql-community-server'],

  }

}
