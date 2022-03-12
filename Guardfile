# frozen_string_literal: true

directories(%w[app lib config spec].select { |d| Dir.exist?(d) ? d : UI.warning(format("Directory %<dir>s does not exist", dir: d)) })
ignore %r{^lib/templates/}

guard "brakeman", run_on_start: true do
  watch(%r{^app/.+.(erb|haml|rhtml|rb)$})
  watch(%r{^config/.+.rb$})
  watch(%r{^lib/.+.rb$})
  watch("Gemfile")
end

guard "fasterer" do
  watch(%r{^app/.*.rb})
end

guard :rspec, cmd: "bundle exec rspec" do
  require "guard/rspec/dsl"
  dsl = Guard::RSpec::Dsl.new(self)

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)

  # Rails files
  rails = dsl.rails(view_extensions: %w[erb haml slim])
  dsl.watch_spec_files_for(rails.app_files)
  dsl.watch_spec_files_for(rails.views)

  watch(rails.controllers) do |controller|
    [
      rspec.spec.call(format("routing/%<controller>s_routing", controller: controller[1])),
      rspec.spec.call(format("controllers/%<controller>s_controller", controller: controller[1])),
      rspec.spec.call(format("acceptance/%<controller>s", controller: controller[1]))
    ]
  end

  # Rails config changes
  watch(rails.spec_helper) { rspec.spec_dir }
  watch(rails.routes) { format("%<controller>s/routing", controller: rspec.spec_dir) }
  watch(rails.app_controller) { format("%<controller>s/controllers", controller: rspec.spec_dir) }

  # Capybara features specs
  watch(rails.view_dirs) { |view| rspec.spec.call(format("features/%<view>s", view: view[1])) }
  watch(rails.layouts) { |layout| rspec.spec.call(format("features/%<layout>s", layout: layout[1])) }

  # Turnip features and steps
  watch(%r{^spec/acceptance/(.+).feature$})
  watch(%r{^spec/acceptance/steps/(.+)_steps.rb$}) do |model|
    Dir[File.join(format("**/%<model>s.feature", model: model[1]))][0] || "spec/acceptance"
  end
end

guard :rubocop, cli: ["--format", "fuubar", "--display-cop-names", "--auto-correct"] do
  watch(/.+.rb$/)
  watch(%r{(?:.+/)?.rubocop(?:_todo)?.yml$}) { |m| File.dirname(m[0]) }
end

# Guard-Rails supports a lot options with default values:
# daemon: false                        # runs the server as a daemon.
# debugger: false                      # enable ruby-debug gem.
# environment: 'development'           # changes server environment.
# force_run: false                     # kills any process that's holding the listen port before attempting to (re)start Rails.
# pid_file: 'tmp/pids/[RAILS_ENV].pid' # specify your pid_file.
# host: 'localhost'                    # server hostname.
# port: 3000                           # server port number.
# root: '/spec/dummy'                  # Rails' root path.
# server: thin                         # webserver engine.
# start_on_start: true                 # will start the server when starting Guard.
# timeout: 30                          # waits untill restarting the Rails server, in seconds.
# zeus_plan: server                    # custom plan in zeus, only works with `zeus: true`.
# zeus: false                          # enables zeus gem.
# CLI: 'rails server'                  # customizes runner command. Omits all options except `pid_file`!

guard :bundler do
  require "guard/bundler"
  require "guard/bundler/verify"
  helper = Guard::Bundler::Verify.new

  files = ["Gemfile"]
  files += Dir["*.gemspec"] if files.any? { |f| helper.uses_gemspec?(f) }

  # Assume files are symlinked from somewhere
  files.each { |file| watch(helper.real_path(file)) }
end
