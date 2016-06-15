# Class: xp_runners
# ===========================
#
# Installs xp-runners, see https://github.com/xp-framework/xp-runners.
#
# This module depends on puppetlabs-apt.
#
# In order to let the module install xp-framework/core as a global package as a
# global Composer package it expects that Composer is already installed, most
# likely through another Puppet module.
#
# Parameters
# ----------
#
# * `manage_package_repo`
#   Switch whether the XP-Runners repository should be used. Optional, defaults
#   to true. All remaining parameters are ignored when this is set to false.
#
# * `repo_location`
#   URL of repository where xp-runners can be found. Optional, defaults
#   to https://dl.bintray.com/xp-runners/debian.
#
# * `repo_release`
#   Which Debian release the package should be chosen for. Optional, defaults
#   to jessie.
#
# * `repo_repos`
#   Which Debian release repository the package should be chosen from. Optional,
#   defaults to main.
#
# * `repo_key_id`
#   ID of repository key. Optional, defaults to key of default repo_location.
#
# * `repo_key_source`
#   Where to find the repository key. Optional, defaults to key of default
#   repo_location.
#
# * `repo_requires_https`
#   Whether repo_location requires https transport. Optional, defaults to true.
#   You should set this to false in case your repo_location doesn't require
#   https.
#
# * `composer_home`
#   Composer home path as defined in `COMPOSER_HOME` environment variable.
#   Optional, undefined by default. When specified the module will try to
#   install xp-framework/core as a global package.
#
# * `composer_path`
#   Path to Composer binary. Optional, defaults to 'composer'. You might want to
#   change this to an absolute path if your Composer binary is not in one of the
#   default pathes, which are /bin, /sbin, /usr/bin, /usr/sbin/ and
#   /usr/local/bin/, or if your binary is 'composer.phar'.
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
  $manage_package_repo = $xp_runners::params::manage_package_repo,
  $repo_location       = $xp_runners::params::repo_location,
  $repo_release        = $xp_runners::params::repo_release,
  $repo_repos          = $xp_runners::params::repo_repos,
  $repo_key_id         = $xp_runners::params::repo_key_id,
  $repo_key_source     = $xp_runners::params::repo_key_source,
  $repo_requires_https = $xp_runners::params::repo_requires_https,
  $composer_home       = undef,
  $framework_version   = $xp_runners::params::framework_version,
  $composer_path       = $xp_runners::params::composer_path,
) inherits xp_runners::params {

  include xp_runners::install

  validate_bool($manage_package_repo)
  if $manage_package_repo {
    validate_bool($repo_requires_https)
    include xp_runners::repository

    anchor { '::xp_runners::begin': } ->
    Class['::xp_runners::repository'] ->
    Class['::xp_runners::install'] ->
    anchor { '::xp_runners::end': }
  }
}
