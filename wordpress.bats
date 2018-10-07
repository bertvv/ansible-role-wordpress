#! /usr/bin/env bats
#
# Functional tests for a wordpress server set up by Ansible role
# bertvv.wordpress.
#
# The variable SUT_IP, the IP address of the System Under Test, must be set
# outside of the script.

@test "The Wordpress install page must be visible" {
  curl --silent --location "http://${SUT_IP}/wordpress/" | \
    grep '<title>WordPress.*Installation<\/title>'
}
