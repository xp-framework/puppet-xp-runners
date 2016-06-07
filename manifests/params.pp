# Class: xp_runners::params
# ===========================
#
# Parameter defaults.
#
# Authors
# -------
#
# Frank Kleine <mikey@stubbles.net>
#
# Copyright
# ---------
#
# Copyright 2016 Frank Kleine
#
class xp_runners::params {

  $manage_package_repo = true
  $repo_location = 'https://dl.bintray.com/xp-runners/debian',
  $repo_release = 'jessie',
  $repo_repos = 'main',
  $repo_key_id = '8756C4F765C9AC3CB6B85D62379CE192D401AB61',
  $repo_key_source = 'https://bintray.com/user/downloadSubjectPublicKey?username=bintray',
  $repo_requires_https = true,
}
