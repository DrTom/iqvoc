require "iqvoc/version"

Apipie.configure do |config|
  config.default_version         = Iqvoc::VERSION
  config.app_name                = "iQvoc"
  config.api_base_url            = "/"
  config.doc_base_url            = "/apidoc"
  config.api_controllers_matcher = ["#{Rails.root}/app/controllers/*.rb",
                                    "#{Rails.root}/app/controllers/concepts/*.rb"]
  config.markup                  = Apipie::Markup::Markdown.new
  config.validate                = false
  config.validate_value          = false
  config.validate_presence       = false
  config.app_info                = <<-EOF
iQvoc is a Vocabulary Management System for the Semantic Web.
EOF
end
