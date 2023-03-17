# frozen_string_literal: true

class Film

  attr_accessor :id,
                :title,
                :description,
                :release_year

  def initialize(id,title,description,release_year)
    @id = id
    @title = title
    @description = description
    @release_year = release_year
  end

  def print_model(film)
    puts "#{film.id}, #{film.title}, #{film.description}"
  end

end
