require 'bundler/setup'

Bundler.require

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/test.sqlite3"
)


require_relative "../app/models/cocktail";
require_relative "../app/main";