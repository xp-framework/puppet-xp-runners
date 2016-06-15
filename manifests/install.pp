# Class: xp_runners::install
# ===========================
#
# Actual steps for installation.
#
# Authors
# -------
#
# Frank Kleine <mikey@stubbles.net>
#
# Copyright
# ---------
#
# Copyright 2015, 2016 Frank Kleine
#
class xp_runners::install {

  package { 'xp-runners':
    ensure => latest,
    tag    => 'xp_runners_repo',
  }

  if $xp_runners::composer_home {
    if 'latest' == $xp_runners::framework_version {
      $version = ''
    } else {
      $version = ":${xp_runners::framework_version}"
    }

    exec { 'composer global require xp-framework/core':
      command     => "${xp_runners::composer_path} global require xp-framework/core${version}",
      path        => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/', '/usr/local/bin/' ],
      environment => ["COMPOSER_HOME=${xp_runners::composer_home}"]
    }
  }
}
