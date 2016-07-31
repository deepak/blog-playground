# A sample Guardfile
# More info at https://github.com/guard/guard#readme

interactor :off

# not app related
ignore /public/, /bin/

# temporary emacs files
ignore(/\/?\.\#/, /~$/)

guard :bundler do
  require 'guard/bundler'
  require 'guard/bundler/verify'
  helper = Guard::Bundler::Verify.new

  files = ['Gemfile']
  files += Dir['*.gemspec'] if files.any? { |f| helper.uses_gemspec?(f) }

  # Assume files are symlinked from somewhere
  files.each { |file| watch(helper.real_path(file)) }
end

guard :shell do
  watch(/(.*).scss/) do |m|
    `bin/scss-lint #{m[0]}`
    `bin/build`
  end
end

guard 'livereload' do
  watch(/(.*).css/)
  watch(/(.*).html/)
end
