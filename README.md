# Ansible role `wordpress`

[![Build Status](https://travis-ci.org/bertvv/ansible-role-wordpress.svg?branch=master)](https://travis-ci.org/bertvv/ansible-role-wordpress)

An Ansible role for installing Wordpress. Specifically, the responsibilities of this role are to:

- install Wordpress dependencies
- install Wordpress by downloading a tarball from wordpress.org
- Configure the database settings and Apache
- fetch security keys and salts
- generate `wp-config.php`

## Dependencies

- [bertvv.httpd](https://galaxy.ansible.com/bertvv/httpd)

## Requirements

You need to have a database server set up with a database, user, and password that can is available to this Wordpress instance. You can set it up on the same machine (e.g. using another Ansible role like [bertvv.mariadb](https://github.com/bertvv/ansible-role-mariadb)), but it can also be an existing database on another host.

## Role Variables

| Variable                      | Default     | Comments (type)                                                                                   |
| :---------------------------- | :---------- | :------------------------------------------------------------------------------------------------ |
| `wordpress_allow_file_mods`   | false       | When `true`, installation of additional themes and plugins through the admin dashboard is allowed |
| `wordpress_automatic_updates` | false       | When `true`, automatic updates are enabled                                                        |
| `wordpress_database_host`     | 'localhost' | The database server.                                                                              |
| `wordpress_database`          | 'wordpress' | The name of the database for Wordpress.                                                           |
| `wordpress_debug`             | false       | When `true`, enables debug mode                                                                   |
| `wordpress_force_ssl`         | false       | When `true`, forces HTTPS on admin pages.                                                         |
| `wordpress_password`          | 'wordpress' | The password of the database user.                                                                |
| `wordpress_plugins`           | []          | Plugins to be installed. See below.                                                               |
| `wordpress_themes`            | []          | Themes to be installed. See below.                                                                |
| `wordpress_user`              | 'wordpress' | The name of the database user.                                                                    |
| `wordpress_version`           | '6.0.2'     | The version of Wordpress to be installed                                                          |

**Remark:** it is **very strongly** suggested to change the default password.

## Plugins and themes

To install plugins and themes (from the Wordpress Plugin and Theme Directory), you need to specify at least the name. Most plugins and themes also have a version, in which case you need to provide it as well. The version number should not be given if the plugins does't have one. An example:

```yaml
wordpress_plugins:
  - name: wp-super-cache
    version: 1.4.5
  - name: jetpack
    version: 3.7.2
  - name: lipsum  # Plugin without a version
wordpress_themes:
  - name: xcel
    version: 1.0.9
```

## Example Playbook

See the test playbooks in either the [Vagrant](https://github.com/bertvv/ansible-role-wordpress/blob/vagrant-tests/test.yml) or [Docker](https://github.com/bertvv/ansible-role-wordpress/blob/docker-tests/test.yml) test environment. See the section Testing for details.


## Testing

There are two types of test environments available. One powered by Vagrant, another by Docker. The latter is suitable for running automated tests on Travis-CI. Test code is kept in separate orphan branches. For details of how to set up these test environments on your own machine, see the README files in the respective branches:

- Vagrant: [vagrant-tests](https://github.com/bertvv/ansible-role-wordpress/tree/vagrant-tests)
- Docker: [docker-tests](https://github.com/bertvv/ansible-role-wordpress/tree/docker-tests)

## License

2-clause BSD license, see [LICENSE.md](LICENSE.md)

## Contributors

- [Bert Van Vreckem](https://github.com/bertvv/) (maintainer)
- [Joran Goossens](https://github.com/jorangooss99)
- [Jordi Stevens](https://github.com/Xplendit)
- [Kwinten Guillaume](https://github.com/kwinteng)
