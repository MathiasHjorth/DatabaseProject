# frozen_string_literal: true
require_relative './factory'

class Film_factory < Factory

  def self.instantiate_objects(type,dataset)
    films = []

    dataset.each do |row|
      films.push(type.new(row['film_id'],row['title'],row['description'],row['release_year']))
    end

    return films
  end

end
