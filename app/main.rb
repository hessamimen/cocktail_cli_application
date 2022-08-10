require 'uri'
require 'net/http'
require 'openssl'
require 'json'


class Main
    def self.cocktail_info_by_name(name)
        uri = URI.parse("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}")
        response = Net::HTTP.get_response(uri)
        response_hash = JSON.parse(response.body)
        {
            name: response_hash['drinks'][0]['strDrink'],
            instruction: response_hash['drinks'][0]['strInstructions']
        }
    end

    def self.get_all_cocktails
        Cocktail.all
    end

    def self.load_cocktails
        cocktail_answers_map.values.each do |name|
            Cocktail.create_or_find_by(cocktail_info_by_name(name))
        end
    end

    def self.search_by_name(name)
        Cocktail.find_by_name(name)
    end

    def self.clean_database
        Cocktail.delete_all
    end

    def self.cocktail_answers_map
        {
            "1"=> "Martini",
            "2"=> "Negroni",
            "3"=> "Margarita",
            "4"=> "Mojito",
            "5"=> "Long Island Tea"
        }
    end
end