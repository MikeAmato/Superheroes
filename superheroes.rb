require 'pg'

# TODO: rename this file to superheroes.rb

# TODO: change the name of the class
class Famoushero

  def initialize
    # TODO: change the dbname to 'superheroes'
    @conn = PG.connect(:dbname =>'superheroes', :host => 'localhost', :user => "Mike", :password => 'kuribod')
    # TODO: change the insert to insert a superhero
    @conn.prepare("insert_superhero", "INSERT INTO superheroes (hero_name, alter_ego, has_cape, power, arch_nemesis) VALUES ($1, $2, $3, $4, $5)")
  end

  def delete_all
    # TODO: fix this
    @conn.exec( "delete from superheroes" )
  end

  def insert_superhero(hero_name, alter_ego, has_cape, power, arch_nemesis)
    # TODO: fix this
    @conn.exec_prepared("insert_superhero", [hero_name, alter_ego, has_cape, power, arch_nemesis])
  end

  # TODO: change method name
  def print_superheroes
    # TODO: fix this
    @conn.exec( "select * from superheroes" ) do |result|
      result.each do |row|
        # TODO: fix this to pretty print the superheroes
        #puts row
        # dob = row['dob'] || 'null'
        if row['has_cape'] == 'no'
          cape = ' not'
        else 
          cape = ''
        end
         puts "#{row['hero_name']} who really is #{row['alter_ego']} has this power, #{row['power']},
         does#{cape} wear a cape, and fights #{row['arch_nemesis']}\n\n" 
      end
    end
  end

  def close
    @conn.close
  end
end

begin
  # TODO: fix this
  hero = Famoushero.new

  hero.delete_all

  # TODO: insert superheroes here.
  hero.insert_superhero('Superman', 'Clark Kent',  'yes', 'Invincible', 'Lex Luther')
  hero.insert_superhero('Green Lantern',  'Hal Jordan', 'no', 'Will', 'Sinestro')
  hero.insert_superhero('Batman', 'Bruce Wayne', 'yes', 'Money and Smarts', 'Joker')
  hero.insert_superhero('Captain America', 'Steven Rogers', 'no', 'Serum and Shield', 'Red Skull')
  hero.insert_superhero('Iron Man', 'Tony Stark', 'no', 'Money and Brains', 'Mandarin')

  # TODO: fix this to use better method name
  hero.print_superheroes
rescue Exception => e
    puts e.message
    puts e.backtrace.inspect
ensure
  hero.close
end


