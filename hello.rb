require 'CSV'
class Hello

  def initialize
    @target = CSV.read("birthday_data.csv")
    @names = ""
    @birthday = ""
    @age = ""
  end

  def prompt
    puts "Tell me a first or last name and I'll give you their birthday"
    name = gets.chomp
    @target.each do |p|
      if p.include? name
        @names = "#{p[1]} #{p[0]}"
        @birthday = p[2]
        year, month, day = p[2].split('/')
        @age = ((Time.now - Time.local(year,month,day))/60/60/24/365).to_i
      end
    end
    puts "Hello, #{@names}. You were born on #{@birthday} and are #{@age} years old. Have a great day!"
  end

 #  puts 'Hello there whats your first name?'
 # name = gets.chomp
 #
 # csv = CSV.foreach('birthday_data.csv', headers: :true) do |row|
 #   if name == row["first_name"]
 #     puts row["last_name"], row["date_of_birth"], row["email"]
 #   end
 # end


end
