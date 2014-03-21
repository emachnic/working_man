Feature: WorkingMan actually works
In order to make it easy to start and stop work each day
I want to have WorkingMan automatically open and close my apps
So that I can be lazy

Scenario: App just runs
  When I get help for "working_man"
  Then the exit status should be 0
  And the output should contain "Commands:"

Scenario: Prints the version number
  When I run `working_man version`
  Then the output should print the version
  And the exit status should be 0

Scenario: Prints the version number when using "-v"
  When I run `working_man -v`
  Then the output should print the version
  And the exit status should be 0

Scenario: Prints the version number when using "--version"
  When I run `working_man --version`
  Then the output should print the version
  And the exit status should be 0

Scenario: Start work successfully with app and url
  Given a file named "/tmp/fakehome/.working_man.yml" with:
    """
    apps:
      - 'Twitter'
    urls:
      - 'http://www.google.com'
    """
  And I run `working_man start`
  Then the output should contain "Work hard today"
  And the exit status should be 0

Scenario: Start work successfully specifying a config file
  Given a file named "/tmp/fakehome/dotfiles/working_man_config.yml" with:
    """
    apps:
      - 'Twitter'
    urls:
      - 'http://www.google.com'
    """
  When I run `working_man start -f ~/dotfiles/working_man_config.yml`
  Then the output should contain "Work hard today"
  And the exit status should be 0

Scenario: Start work unsuccessfully without any apps
  Given a file named "/tmp/fakehome/.working_man.yml" with:
    """
    apps:
    urls:
      - 'http://www.google.com'
    """
  And I run `working_man start`
  Then the output should contain "No applications in configuration"
  And the exit status should be 2

Scenario: Start work unsuccessfully without a configuration
  Given a file named "/tmp/fakehome/.working_man.yml" should not exist
  When I run `working_man start`
  Then the output should contain "No configuration found."
  And the exit status should be 1

Scenario: Stop work successfully
  Given a file named "/tmp/fakehome/.working_man.yml" with:
    """
    apps:
      - 'Twitter'
    urls:
      - 'http://www.google.com'
    """
  When I run `working_man stop`
  Then the output should contain "Have a great day!"
  And the exit status should be 0
