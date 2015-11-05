class Produto < ActiveRecord::Base

	validates :quantidade, presence: true

end
