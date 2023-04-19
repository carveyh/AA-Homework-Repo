# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  house_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Person < ApplicationRecord
	validates :name, presence: true

	belongs_to :home,
		class_name: :House,
		foreign_key: :house_id,
		primary_key: :id
end
