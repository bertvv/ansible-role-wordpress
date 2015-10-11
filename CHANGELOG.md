# Change log

This file contains al notable changes to the wordpress Ansible role.

This file adheres to the guidelines of [http://keepachangelog.com/](http://keepachangelog.com/). Versioning follows [Semantic Versioning](http://semver.org/).

## 1.1.2 - 2015-10-11

This is a bugfix release

### Changes

- Fixed #2 (downloading plugins/themes without a version number). Credit to [Jordi Stevens](https://github.com/Xplendit)
- Fixed #4 (Playbook sometimes crashes when getting new salts). As a consequence of the changes, the playbook will no longer fetch new salts every time it is run. When you want to get new salts, delete /usr/share/wordpress/wp-salts.php and re-run the playbook.
- Replace hard-coded values of Wordpress installation directory with a variable

## 1.1.1 - 2015-10-07

### Changes

- Fixed missing value of `wordpress_themes`

## 1.1.0 - 2015-10-07

### Added

- Install plugins with role variable `wordpress_plugins`
- Install themes with role variable `wordpress_themes`

## 1.0.0 - 2015-04-28

First release!

### Added

- Installs Wordpress and generates `wp-config.php` with safe secret keys and salts

