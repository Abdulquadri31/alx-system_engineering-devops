# File: 2-execute_a_command.pp
exec { 'killmenow':
  command => 'pkill killmenow',
  path    => '/bin:/usr/bin:/sbin:/usr/sbin',
  onlyif  => 'pgrep killmenow',
}
