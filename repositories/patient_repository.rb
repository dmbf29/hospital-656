require 'csv'
require_relative '../models/patient'
class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @patients = []
    @next_id = 1
    load_csv
  end

  def all
    @patients
  end

  def add(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      # CSV rows act like a hash
      row[:id] = row[:id].to_i
      row[:age] = row[:age].to_i
      row[:cured] = row[:cured] == 'true'
      patient = Patient.new(row)
      room = @room_repository.find(row[:room_id].to_i)
      room.add_patient(patient)
      @patients << patient
    end
    @next_id = @patients.any? ? @patients.last.id + 1 : 1
  end
  #<CSV::Row id:"1" name:"viddy" age:"30" cured:"false">
  #<CSV::Row id:"2" name:"derek" age:"30" cured:"false">
  #<CSV::Row id:"3" name:"kevin" age:"30" cured:"false">
end
