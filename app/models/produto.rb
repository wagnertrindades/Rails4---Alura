class Produto < ActiveRecord::Base

	validates :quantidade, presence: true
	validates :nome, length: { minimum: 5 }
end
