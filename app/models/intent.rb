
class Intent
  include NamedInstances

  attr_reader :name, :hmac_key
  def initialize(name, hmac_key)
    @name = name
    @hmac_key = hmac_key
  end

end

Intent.new(
  "change_avatar",
  "secret key"
)
