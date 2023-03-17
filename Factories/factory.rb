# frozen_string_literal: true

class Factory

  def self.get_type(model)
    type = Object.const_get(model)
    return type
  end

  def instantiate_objects(type,dataset)
    raise NotImplementedError
  end

end
