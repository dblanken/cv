class ContactLinker
  URLS = {
    "Email" => "mailto:VALUE?subject=Resume%20Inquiry",
    "Web" => "https://VALUE",
    "Twitter" => "https://twitter.com/VALUE",
    "GitHub" => "https://github.com/VALUE",
    "LinkedIn" => "https://linkedin.com/VALUE"
  }.freeze

  def self.for(contact_type, value)
    URLS[contact_type].gsub 'VALUE', value
  end
end
