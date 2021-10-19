class SearchParamsValidator
  include ActiveModel::Validations

  attr_reader :data

  validates_each :start_date, :end_date do |record, attr, value|
    value&.to_datetime
  rescue StandardError
    record.errors.add(attr, 'Invalid date')
  end

  def initialize(data)
    @data = data
  end

  def read_attribute_for_validation(key)
    data[key]
  end
end
