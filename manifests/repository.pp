# Class: xp_runners::repository
# ===========================
#
# Manage xp-runners repository.
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
class xp_runners::repository {

  include ::apt

  if $xp_runners::repo_requires_https {
    ensure_packages(['apt-transport-https'])
    apt::source { 'xp_runners_repo':
      location => $xp_runners::repo_location,
      release  => $xp_runners::repo_release,
      repos    => $xp_runners::repo_repos,
      key      => {
        id     => $xp_runners::repo_key_id,
        source => $xp_runners::repo_key_source,
      },
      require  => Package['apt-transport-https']
    }
  } else {
    apt::source { 'xp_runners_repo':
      location => $xp_runners::repo_location,
      release  => $xp_runners::repo_release,
      repos    => $xp_runners::repo_repos,
      key      => {
        id     => $xp_runners::repo_key_id,
        source => $xp_runners::repo_key_source,
      }
    }
  }
}
