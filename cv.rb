require 'yaml'
require 'erb'
require 'optparse'
require_relative './lib/contact_linker'
require_relative './lib/config'
require_relative './lib/acts_like_rails'

# require 'debug'

include ActsLikeRails

DEFAULT_FILENAME = 'resume.yml'
DEFAULT_ROLE = 'software_engineer'

options = {
  role: DEFAULT_ROLE,
  filename: DEFAULT_FILENAME
}
OptionParser.new do |opt|
  opt.on('--role ROLE') { |o| options[:role] = o }
  opt.on('--filename FILENAME') { |o| options[:filename] = o }
  opt.on('-h') do
    puts "Usage: ruby cv.rb --role ROLE --filename FILENAME"
    puts "role: The subdirectory under templates to use"
    puts "filename: The YAML file location"
    return 0
  end
end.parse!

@role = options[:role]
filename = options[:filename]

@config = Config.new(filename: filename)

erb = ERB.new(
  File.read(
    File.join("./templates/#{@role}/index.html.erb")
  )
)

output = erb.run(binding)

puts output
