class DateValidate < ActiveModel::Validator
  def validate(record)
    if record.check_in >= record.check_out
      record.errors.clear
      record.errors.add :base, 'The date you requested is invalid, please make sure that check out date occurs after check in date.'
      false
    end
  end

end