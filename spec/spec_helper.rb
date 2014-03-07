# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

ENV['SAUCE_USERNAME'] = 'ryanstout'
ENV['SAUCE_ACCESS_KEY'] = 'a537b01d-33ed-4028-9e80-eeb602748a5f'

if ENV['IN_BROWSER']
  if RUBY_PLATFORM == 'opal'
  else
    require 'capybara/rspec'
    # Needed at the moment to get chrome tests working
    require 'chromedriver2/helper'
    require 'capybara/poltergeist'
    # require "sauce/capybara"
    # require 'sauce/connect'
  end
end

require 'volt'

# Capybara.default_driver = :sauce
# Capybara.server_port = 2020
#
# Sauce.config do |conf|
#   conf[:start_tunnel] = true
#   conf[:browsers] = [
#     ["Windows 7","Firefox","26"]
#   ]
#   # conf[:application_host] = "127.0.0.1"
#   # conf[:application_port] = "2020"
#   # conf[:browser_url] = "http://127.0.0.1:2020/"
# end

# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end

if ENV['IN_BROWSER']
  if RUBY_PLATFORM == 'opal'
  else
    require 'volt/server'


    kitchen_sink_path = File.expand_path(File.join(File.dirname(__FILE__), "apps/kitchen_sink"))
    Capybara.app = Server.new(kitchen_sink_path).app

    Capybara.default_driver = :poltergeist

    # Capybara.register_driver :chrome do |app|
    #   Capybara::Selenium::Driver.new(app, :browser => :chrome)
    # end
    #
    # Capybara.default_driver = :chrome

    # Capybara.default_driver = :selenium
  end
end


if RUBY_PLATFORM != 'opal'
  RSpec.configure do |config|
    config.run_all_when_everything_filtered = true
    config.filter_run :focus

    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    config.order = 'random'
  end
end
