require 'active_support/core_ext/string/inflections'
require 'erb'

# Taken from Sandi Metz's presentation: SOLID Object-Oriented Design by Sandi Metz
class Config
  attr_reader :data, :filename

  def initialize(opts)
    @filename = opts[:filename]
    @data = safely_load_erb_yaml_document(@filename)
    define_methods_for_environment(data.keys)
  end

  def get_binding
    binding
  end

  private

  def define_methods_for_environment(names)
    names.each do |name|
      sanitized_name = ActiveSupport::Inflector.underscore(ActiveSupport::Inflector.parameterize(name))
      self.class.class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def #{sanitized_name}               # def ftp_host
          data['#{name}']                   #   data['ftp_host']
        end                                 # end
      RUBY
    end
  end

  def safely_load_erb_yaml_document(filename)
    YAML.safe_load(
      ERB.new(
        File.read(filename)
      ).result, aliases: true
    )
  end
end
