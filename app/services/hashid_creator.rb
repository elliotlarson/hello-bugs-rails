class HashidCreator
  def self.call(value = nil)
    value = (Time.now.to_f * 1000).to_i if value.nil?
    Hashids.new(HASHID_SALT, HASHID_LENGTH).encode(value)
  end
end
