class Country < ActiveRecord::Base
  validates_uniqueness_of :code, :name, case_sensitive: false
  validates_presence_of :code, :name

  def state_codes
    State.where(country_code: self.code).collect { |s| s.code }
  end
end
