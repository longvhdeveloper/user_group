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

require 'rails_helper'

RSpec.describe Presentation, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
