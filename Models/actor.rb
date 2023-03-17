# frozen_string_literal: true

class Actor

  attr_accessor :id,
                :first_name,
                :last_name,
                :last_update

  def initialize(id,first_name,last_name,last_update)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @last_update = last_update
  end

  def print_model(actor)
    puts "#{actor.id}, #{actor.first_name}, #{actor.last_name}"
  end

end
