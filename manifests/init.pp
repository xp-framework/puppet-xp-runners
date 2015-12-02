# Class: xp_runners
# ===========================
#
# Installs xp-runners, see https://github.com/xp-framework/xp-runners.
#
# This module depends on puppetlabs-apt.
#
# Parameters
# ----------
#
# This module has no parameters.
#
# Examples
# --------
#
# @example
#    class { 'xp_runners':
#    }
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
class xp_runners {
  include xp_runners::install
}
