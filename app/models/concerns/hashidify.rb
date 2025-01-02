module Hashidify
  extend ActiveSupport::Concern

  included do
    before_create do |me|
      me.hashid = HashidCreator.call unless me.hashid
    end
  end

  def to_param
    hashid
  end
end
