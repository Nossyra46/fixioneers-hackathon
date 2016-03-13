class Refugee < ActiveRecord::Base
  rolify

  belongs_to :organisation
end
