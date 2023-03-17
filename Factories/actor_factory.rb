# frozen_string_literal: true
require_relative './factory'

class Actor_factory < Factory

  def self.instantiate_objects(type,dataset)
    actors = []

    dataset.each do |row|
      actors.push(type.new(row['actor_id'],row['first_name'],row['last_name'],row['last_updated']))
    end

    return actors
  end

end
