# frozen_string_literal: true
require 'pg'

module Database_Access

  @@database_password = ""

  @@connection_hash = {host: 'localhost',port: 5432 ,dbname: 'dvdrental_barebone',user: 'postgres'}

  def self.read_all(table_name)

    @@connection_hash[:password] = @@database_password

    conn = PG::Connection.new(@@connection_hash)
    result = conn.exec("SELECT * FROM #{table_name} FETCH FIRST 5 ROWS ONLY")
    conn.close
    return result
  end

  def self.update_prompts(table_name)
    puts "Provide id:"
    id = gets.chomp
    puts "Provide column:"
    column = gets.chomp
    puts "Enter new value:"
    new_value = gets.chomp
    update(table_name,id,column,new_value)
  end

  def self.update(table_name, id, column, new_value)

    @@connection_hash[:password] = @@database_password

    conn = PG::Connection.new(@@connection_hash)
    result = conn.exec("UPDATE #{table_name} SET #{column} = #{new_value} WHERE #{table_name.downcase}_id = #{id}")
    conn.close
    return result
  end

  Database_options = {1 => method(:read_all), 2 => method(:update_prompts), 3 => :delete}
  Database_options_view = {1 => "Read all", 2 => "Update", 3 => "Delete"}

end
