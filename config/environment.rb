require 'bundler/setup'
require 'colorize'


Bundler.require

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/development.sqlite3"
)

ActiveRecord::Base.logger = nil



require_relative "../app/models/cocktail";
require_relative "../app/main";
require_relative "../app/cli";