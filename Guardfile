require 'guard-ctags'
guard 'rspec', :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end


guard 'ctags', {'.rb' => 'ctags', '.coffee' => 'coffeetags'} do
  watch(%r{^lib/(.+)\.rb$})
  watch(%r{\w*.coffee})
end
