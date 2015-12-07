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
# Copyright 2015 Frank Kleine
#
class xp_runners::install {

  # repository with xp-runners requires https
  ensure_packages(['apt-transport-https'])

  # make xp_runners repository available
  apt::source { 'xp_runners_repo':
    location => 'https://dl.bintray.com/xp-framework/xp-runners',
    release  => 'jessie',
    repos    => 'main',
    key      => {
      id     => '8756C4F765C9AC3CB6B85D62379CE192D401AB61',
      source => 'https://bintray.com/user/downloadSubjectPublicKey?username=bintray',
    },
    require  => Package['apt-transport-https']
  }

  package { 'xp-runners':
    ensure  => latest,
    require => Apt::Source['xp_runners_repo']
  }
}

