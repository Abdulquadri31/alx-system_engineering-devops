# File: 0-create_a_file.pp
file { '/tmp/school':
  ensure  => 'file',
  content => 'I love Puppet',
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
}
