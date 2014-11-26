# == Schema Information
#
# Table name: presentations
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  meeting_id  :integer
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Presentation < ActiveRecord::Base
  belongs_to :user
  belongs_to :meeting

  validates :title, :presence => true
end
