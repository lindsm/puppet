# Tested against CENTOS

# Not sure of environment, so keeping the webpage self contained in a variable.  Would prefer to do this with a module/template
$my_quote = 
"
  <HEAD>
  <TITLE>Basic webpage for PSE Exercise</TITLE>
  </HEAD>
  <BODY BGCOLOR='Silver'>
  <CENTER>
  <H1>PSE Exercise</H1>

  <IMG SRC=\"http://puppetlabs.com/sites/default/files/PL_logo_horizontal_RGB_0.svg\">

  <H2>Useful Links</H2>

  <A HREF='http://docs.puppetlabs.com'>Official Documentation</A><BR>
  <A HREF='http://projects.puppetlabs.com'>Ticket Tracker and Community Wiki</A><BR>
  <A HREF='http://puppetlabs.com/blog/'>Official Blog</A><BR>
  <A HREF='http://www.planetpuppet.org/'>Planet Puppet Blog Aggregate</A><BR>
  <A HREF='http://forge.puppetlabs.com'>Puppet Module Forge</A>


  </CENTER>

  <H1>This is a size \"1\" heading</H1>

  <H2>This is a size \"2\" heading</H2>

  <H3>This is a size \"3\" heading</H3>

  <H4>This is a size \"4\" heading</H4>

  <H5>This is a size \"5\" heading</H5>

  <H6>This is a size \"6\" heading</H6>
"

$my_default_conf = "
server {
    listen       8000 default_server;
    server_name  _;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    error_page  404              /404.html;
    location = /404.html {
        root   /usr/share/nginx/html;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}
"

#  Making sure NGINX is installed
package {'nginx':
  ensure => 'latest',
}
# Modifying and enforcing index.html
file {'index.html':
  path    => '/usr/share/nginx/html/index.html',
  ensure  => present,
  content => $my_quote,
  require => Package['nginx'],
}
# Modifying and Enforcing my default default.conf
file {'default.conf':
  path    => '/etc/nginx/conf.d/default.conf',
  ensure  => present,
  content => $my_default_conf,
  require => Package['nginx'],
} 
# Make sure the service is running and subscribe to the config file
service {'nginx':
  ensure => running,
  enable => true,
  subscribe => File['default.conf'],
}
