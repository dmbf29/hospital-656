class Patient
  attr_reader :name, :age
  attr_accessor :room, :id

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @name = attributes[:name] # string
    @age = attributes[:age] # integer
    @cured = attributes[:cured] || false # boolean
    @room = attributes[:room] # INSTANCE
  end

  def cured?
    @cured
  end

  def cure!
    @cure = true
  end
end
