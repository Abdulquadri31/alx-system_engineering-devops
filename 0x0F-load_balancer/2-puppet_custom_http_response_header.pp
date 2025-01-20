# Puppet manifest to configure Nginx with a custom HTTP header X-Served-By

node default {
  # Ensure Nginx package is installed
  package { 'nginx':
    ensure => installed,
  }

  # Ensure Nginx service is running and enabled
  service { 'nginx':
    ensure     => running,
    enable     => true,
    require    => Package['nginx'],
  }

  # Configure Nginx to include the custom header
  file { '/etc/nginx/sites-available/default':
    ensure  => file,
    content => template('nginx/default.erb'),
    notify  => Service['nginx'],
  }

  # Ensure the Nginx configuration directory exists
  file { '/etc/nginx/sites-enabled':
    ensure => directory,
  }

  # Create symbolic link to enable the default configuration
  file { '/etc/nginx/sites-enabled/default':
    ensure => link,
    target => '/etc/nginx/sites-available/default',
    require => File['/etc/nginx/sites-available/default'],
    notify  => Service['nginx'],
  }
}
