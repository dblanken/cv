require 'yaml'
require 'erb'
require 'optparse'
require_relative './lib/contact_linker'
require_relative './lib/contact_markdown'
require_relative './lib/config'
require_relative './lib/acts_like_rails'

require 'debug' if ENV['DEBUG']

include ActsLikeRails

DEFAULT_FILENAME = 'resume.yml'.freeze
DEFAULT_ROLE = 'software_engineer'.freeze
DEFAULT_TYPE = 'html'.freeze

options = {
  role: DEFAULT_ROLE,
  filename: DEFAULT_FILENAME,
  output_type: DEFAULT_TYPE
}
OptionParser.new do |opt|
  opt.on('--role ROLE') { |o| options[:role] = o }
  opt.on('--filename FILENAME') { |o| options[:filename] = o }
  opt.on('--type TYPE') { |o| options[:output_type] = o }
  opt.on('-h') do
    puts 'Usage: ruby cv.rb --role ROLE --filename FILENAME --type TYPE'
    puts 'role: The subdirectory under templates to use'
    puts 'filename: The YAML file location'
    puts 'type: The type of output: "html", "md"'
    return 0
  end
end.parse!

@role = options[:role]
filename = options[:filename]
@output_type = options[:output_type]

@config = Config.new(filename: filename)

erb = ERB.new(
  File.read(
    File.join("./templates/#{@role}/index.#{@output_type}.erb")
  ),
  trim_mode: '-'
)

output = erb.run(binding)

puts output
