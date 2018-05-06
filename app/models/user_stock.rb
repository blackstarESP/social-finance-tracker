# == Schema Information
#
# Table name: user_stocks
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  stock_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Class defines database relationsships for user_stocks table
class UserStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock
end
