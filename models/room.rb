class Room
  attr_reader :patients, :capacity
  attr_accessor :id
  class CapacityReachedError < StandardError; end

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @capacity = attributes[:capacity] # integer
    @patients = [] # an array of INSTANCES
  end

  def full?
    @patients.length == @capacity
  end

  # vip_room.add_patient(derek)
  def add_patient(patient)
    if full?
      raise CapacityReachedError, "Room is full."
    else
      @patients << patient
      patient.room = self
    end
  end
end
