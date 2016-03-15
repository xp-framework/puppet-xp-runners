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
# * `manage_package_repo`
#   Switch whether the XP-Runners repository should be used. Optional, defaults
#   to true.
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
class xp_runners (
  $manage_package_repo  = $xp_runners::params::manage_package_repo,
){

  include xp_runners::install

  if $manage_package_repo {
    include xp_runners::repository

    anchor { '::xp_runners::begin': } ->
    Class['::xp_runners::repository'] ->
    Class['::xp_runners::install'] ->
    anchor { '::xp_runners::end': }
  }
}
