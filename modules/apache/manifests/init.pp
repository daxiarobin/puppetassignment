class apache {
  $logdir = "/var/log/httpd"
  $confdir = "/etc/httpd/conf"
  $doc_root = "/var/www"
  package { 'httpd':
    ensure => present,
    before => Service['httpd'],
  }

  file_line { 'change1':
    path  => "/etc/puppetlabs/code/environments/production/modules/apache/files/httpd.conf",
    line  => "DocumentRoot \"${doc_root}\"",
    match => '^DocumentRoot',
  }
  service { 'httpd':
    ensure => running,
    enable => true,
    require => Package['httpd'],
    subscribe => File['/etc/httpd/conf/httpd.conf'],
  }

  file { '/etc/httpd/conf/httpd.conf':
    ensure => file,
    source => 'puppet:///modules/apache/httpd.conf',
    require => Package['httpd'],
    notify => Service['httpd'],
  }

}
