class ContactMarkdown
  URLS = {
    "Email" => "VALUE",
    "Web" => "https://VALUE",
    "Twitter" => "@VALUE",
    "GitHub" => "https://github.com/VALUE",
    "LinkedIn" => "https://linkedin.com/VALUE"
  }.freeze

  def self.for(contact_type, value)
    URLS[contact_type].gsub 'VALUE', value
  end
end

