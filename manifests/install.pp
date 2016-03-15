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
    tag    => 'xp_runners_repo'
  }
}

