require_relative 'repositories/patient_repository'
require_relative 'repositories/room_repository'
require_relative 'models/patient'
require_relative 'models/room'

viddy = Patient.new(name: 'Viddy', age: 30)
derek = Patient.new(name: 'Derek', age: 30)
kevin = Patient.new(name: 'Kevin', age: 30)

vip_room = Room.new(capacity: 2)
big_room = Room.new(capacity: 20)

# vip_room.add_patient(viddy)
# vip_room.add_patient(derek)
# vip_room.add_patient(kevin)

csv_file_path = 'data/rooms.csv'
room_repository = RoomRepository.new(csv_file_path)

csv_file_path = 'data/patients.csv'
patient_repository = PatientRepository.new(csv_file_path, room_repository)


# pierre = Patient.new(name: 'Pierre', age: 30)
# patient_repository.add(pierre)

p patient_repository
