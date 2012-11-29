class userdata {
  #install all bash files
  file {
    '/home/pi/':
      ensure => directory,
      recurse => true,
      source => "puppet:///modules/userdata/home",
      purge => false,
      mode => 644,
      owner => "pi",
      group => "pi"
  }
  #install ssh keys
  ssh_authorized_key {
    "newloki":
        name => "newloki",
        key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAsfmYgS9vbu6LbTN31/QEMlz8Vp882n117X+XHzlyUMcRNQD/UsbudpBL8m8/b2czZZ5LRn6wp3ZsW5/nIuloXZ5RYu6VbOHo5YA0MvvmpLUc8YV8PJmyYVBo70WdwPWozXtbByDAN0GW5xqt8CRdx4J8bmiXaVWHZgjrpxIsfgRX/LNet4YI/nTvegRt+Lb7QA3g6yT7zdK097IqBiKEcH5K0AWc49Yfo116YzyishGUV4NqLqVVljQfG79zlmbF8msCh2mPf8OGZSG71V3dIbl8nmT/30QBb8Ma9d+v6ZZ7YaSCASVFIdcshmojXieKUEEnZ8zb/Nvvov9TjW7xdQ==", 
        type => "rsa",
        user => "pi"
  }
}
