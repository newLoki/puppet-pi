node default {
  Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/',  ],
    logoutput => on_failure,
  }

  class {
    ['vim', 'userdata']:
  }
}
