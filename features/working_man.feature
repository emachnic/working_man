Feature: My bootstrapped app kinda works
In order to get going on coding my awesome app
I want to have aruba and cucumber setup
So I don't have to do it myself

Scenario: App just runs
  When I get help for "working_man"
  Then the exit status should be 0
  And the banner should be present
  And the banner should document that this app takes options
  And the following options should be documented:
    |--version|
  And the banner should document that this app's arguments are:
    | run_type | which is required |
  
Scenario: Start work successfully with app and url
  Given a file named "/tmp/fakehome/.working_man.yml" with:
    """
    apps:
      - 'Twitter'
    urls:
      - 'http://www.google.com'
    """
  Then the file "/tmp/fakehome/.working_man.yml" should contain "Twitter"
  And I run `working_man start`
  Then the output should contain "Work hard today"
  And the exit status should be 0
  
Scenario: Start work successfully with app and no url
  Given a file named "/tmp/fakehome/.working_man.yml" with:
    """
    apps:
      - 'Twitter'
    urls:
    """
  Then the file "/tmp/fakehome/.working_man.yml" should contain "Twitter"
  And I run `working_man start`
  Then the output should contain "Work hard today"
  And the exit status should be 0

Scenario: Start work unsuccessfully without any apps
  Given a file named "/tmp/fakehome/.working_man.yml" with:
    """
    apps:
    urls:
      - 'http://www.google.com'
    """
  Then the file "/tmp/fakehome/.working_man.yml" should contain "http://www.google.com"
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