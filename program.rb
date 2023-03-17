# frozen_string_literal: false
require_relative './Models/actor'
require_relative './Models/film'
require_relative './DataAccess/database_access'
require_relative './Factories/factory'
require_relative './Factories/actor_factory'
require_relative './Factories/film_factory'

include Database_Access

class Program

  Model_options = {1 => "Actor", 2 => "Film", 3 => "Staff"}
  @model_pick = ""

  def self.display_hash(hash)
    hash.each {|key,value| puts "#{key}: #{value}"}
  end

  def self.retrieve_data(database_operation_pick)
    #retrieve data via database_access:

    model = Model_options[@model_pick.to_i]
    data = Database_Access::Database_options[database_operation_pick.to_i].call(model)
    type = Factory.get_type(model)
    factory_type = Object.const_get("#{model}_factory")

    return factory_type.instantiate_objects(type,data)
  end

  def self.display_objects(model_objects)
    model_objects.each do |elem|
      elem.print_model(elem)
    end
  end


  def self.display_sub_menu
    #sub-menu one level below top menu

    system('cls')
    while true do

      puts "Choose database operation, hit 'b' to return to main menu"

      #display options and pick:
      display_hash(Database_Access::Database_options_view)
      database_operation_pick = gets.chomp

      if (database_operation_pick == "b") then
        break
      else
        model_objects = retrieve_data(database_operation_pick)
        display_objects(model_objects)
      end

      gets

    end

  end


  #Top-level menu:
  puts "DataProject initialized.."
  puts "Enter Database password:"
  password = gets.chomp
  Database_Access.class_variable_set(:@@database_password,password)
  while true do
    system('cls')
    puts "Choose model option, type 'exit' to exit program"
    display_hash(Model_options)
    @model_pick = gets.chomp
    if (@model_pick == "exit") then break end
    display_sub_menu()
  end



end
