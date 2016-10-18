class strace {
  $packagelist = [ 'strace' ]
  
  package { $packagelist:
   ensure => installed,
  }

}
