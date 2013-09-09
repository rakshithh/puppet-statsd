package { 'python-software-properties':
    ensure => present,
}
package { 'python':
    ensure => present,
}
package { 'g++':
    ensure => present,
}
package { 'make':
    ensure => present,
}
package { 'git':
    ensure => present,
}
exec{ 'apt-add-repository':
    command => '/usr/bin/add-apt-repository ppa:chris-lea/node.js',
}
exec{ 'apt-get-update':
    notify => Package["nodejs"],
    command => '/usr/bin/apt-get update',
}
package { 'nodejs':
    ensure => present,
}
exec{ 'swift-informant':
    command => '/usr/bin/git clone https://github.com/pandemicsyn/swift-informant.git',
}
exec{ 'swift-informant-install':
    command => '/usr/bin/python swift-informant/setup.py install',
}
exec{ 'statsd':
    command => '/usr/bin/git clone https://github.com/etsy/statsd.git',
    notify => exec["statsd config copy"],
}
exec{ 'statsd config copy':
    command => '/bin/cp statsd/exampleConfig.js statsd/Config.js',
}
#exec{ 'statsd service start':
#    command => '/usr/bin/nohup node stats.js Config.js &',
#}
