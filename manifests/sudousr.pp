class sudousr {
     
     sudo::conf { 'becca':
       ensure  => present,
       content => 'becca ALL=(ALL) ALL',
     }

     sudo::conf { 'wheel':
       ensure  => present,
       content => '%wheel ALL=(ALL) ALL',
     }

     sudo::conf { 'ec2-user':
     ensure  => present,
     content =>  '%ec2-user ALL=(ALL) NOPASSWD: ALL',
                  
     }
}

