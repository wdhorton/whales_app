guard :rspec, cmd: "bundle exec rspec" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)/(.+)\.rb$})     { |m| "spec/#{m[1]}/#{m[2]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
