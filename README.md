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
5. `vagrant up` will then create a VM and apply a test playbook, <`test.yml`>.

