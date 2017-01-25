# Vagrant test environment

This branch contains a test environment for the wordpress role, powered by Vagrant.

I use [git-worktree(1)](https://git-scm.com/docs/git-worktree) to include the test code into the working directory. Instructions for running the tests:

1. Fetch the tests branch: `git fetch origin vagrant-tests`
2. Create a Git worktree for the test code: `git worktree add vagrant-tests vagrant-tests` (remark: this requires at least Git v2.5.0). This will create a directory `vagrant-tests/`.
3. `cd vagrant-tests/`
4. Install dependencies:
    ```
    $ ansible-galaxy install -p roles/ bertvv.mariadb
    $ ansible-galaxy install -p roles/ bertvv.httpd
    ```
5. Check the Vagrant environment:
    ```
    $ vagrant status
    Current machine states:
    
    db                        running (virtualbox)
    centos72-wordpress        running (virtualbox)
    fedora25-wordpress        not created (virtualbox)
    
    This environment represents multiple VMs. The VMs are all listed
    above with their current state. For more information about a specific
    VM, run `vagrant status NAME`.
    
    ```
7. `vagrant up db PLATFORM-wordpress` will then create two VMs, one for the database and one for the Apache/Wordpress installation and apply a test playbook, <`test.yml`>. `PLATFORM` is one of the supported platforms (see output of `vagrant status`).

The Wordpress site should be visible on e.g. <http://192.168.56.4/wordpress/> for the CentOS 7.2 box, and <http://192.168.56.5/wordpress/> for the Fedora 25 box.
