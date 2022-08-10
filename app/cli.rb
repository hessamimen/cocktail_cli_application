#https://www.devdungeon.com/content/colorize-ruby-terminal-output
class Cli
    LINE = "***********************".light_black
    def initialize
        puts LINE
        puts "                    *** -----------Welcome to my CLI application ----------- ***  ".light_magenta.italic
        puts "Here you can find out how to make your favourite cocktail".green.bold
        puts "Are you over 18 years old???".light_red.bold.blink
        plus18 = gets.strip
        if plus18 == 'y'
            continue = 'y'
            while continue == 'y'
                puts "Please choose your cocktail from the list:(a number between 1~5)".light_cyan.on_light_black
                # puts "1. Mojito"
                # puts "2. Long Island Tea"
                # puts "3. Negroni"
                # puts "4. Dry Martini"
                # puts "5. Margarita"
                Main.cocktail_answers_map.each do |key, value|
                    puts "#{key}. #{value}"
                end

                puts LINE

                answer =gets.strip
                cocktail_info(answer)
                puts "Do you want to continue?(y/n)"
                continue = gets.strip
            end
        end
        puts LINE
        puts "Goode bye my friend".light_magenta
    end
#get cocktail info from the Database ===============================
    def cocktail_info(answer)
            cocktail_name = Main.cocktail_answers_map[answer]
            if(cocktail_name)
            cocktail = Cocktail.find_by_name(cocktail_name)
              puts "Cocktail name:\n".blue + cocktail.name.light_green
              puts LINE
              puts "Instruction:\n".blue + cocktail.instruction.light_green
              puts LINE
            else
              puts "Invalid answer"  
            end
    end 
end
