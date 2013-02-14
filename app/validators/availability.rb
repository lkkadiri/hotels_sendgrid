class Availability < ActiveModel::Validator
  def validate(record)
    rooms = Room.where("rooms.id NOT IN (SELECT reservations.room_id from reservations WHERE NOT( reservations.check_out <= ? OR reservations.check_in >= ?) )",record.check_in,record.check_out)
    room = rooms.find { |room| room.id == record.room_id }
    if room.nil?
      record.errors[:base] << 'The date you requested is taken.'
      #send email
    end
  end
end