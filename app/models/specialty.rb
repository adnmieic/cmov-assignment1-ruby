class Specialty < ActiveRecord::Base
  has_and_belongs_to_many :doctors

  def as_json(options = {})
    options = { :only => [:id, :name] }
    super(options)
  end
end
