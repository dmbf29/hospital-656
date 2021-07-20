require 'csv'
require_relative '../models/room'

class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @rooms
  end

  def add(room)
    room.id = @next_id
    @rooms << room
    @next_id += 1
  end

  def find(id)
    @rooms.find do |room|
      room.id == id
    end
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      # CSV rows act like a hash
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      @rooms << Room.new(row)
    end
    @next_id = @rooms.any? ? @rooms.last.id + 1 : 1
  end
  #<CSV::Row id:"1" name:"viddy" age:"30" cured:"false">
  #<CSV::Row id:"2" name:"derek" age:"30" cured:"false">
  #<CSV::Row id:"3" name:"kevin" age:"30" cured:"false">
end
