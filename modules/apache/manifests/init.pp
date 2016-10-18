class apache {
        package { 'httpd':
                ensure => present,
                before => Service['httpd'],
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
