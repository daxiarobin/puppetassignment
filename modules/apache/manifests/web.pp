define apache::web (
  $studentnumber = "${name}",
  $conftemplate = "",
) {
  include apache
  file { "${apache::doc_root}/index.html":
    ensure => file,
    content => "<h1>Hello my Student number is $studentnumber</h1>",
    mode    => '0664',
  }  

}
