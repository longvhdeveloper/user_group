# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string(255)
#  encrypted_password :string(20)
#  name               :string(255)
#  profile            :text
#  is_admin           :boolean          default(FALSE)
#  created_at         :datetime
#  updated_at         :datetime
#  salt               :string(40)
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
