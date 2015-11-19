When /^I get help for "([^"]*)"$/ do |app_name|
  @app_name = app_name
  step %(I run `#{app_name} --help`)
end

Then /^the output should print the version$/ do
  # assert_partial_output(WorkingMan::VERSION, all_output)
  expect(last_command_started).to have_output WorkingMan::VERSION
end
