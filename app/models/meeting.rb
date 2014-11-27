# == Schema Information
#
# Table name: meetings
#
#  id          :integer          not null, primary key
#  meet_on     :date
#  location    :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Meeting < ActiveRecord::Base

  has_many :presentations

  scope :upcomming_meetings, -> {where('meetings.meet_on > ?', [Time.zone.now])
                                .order('meetings.meet_on')}

  scope :pastcomming_meetings, -> {where('meetings.meet_on <= ?', [Time.zone.now])
                                  .order('meetings.meet_on')}

  validates :meet_on, :presence => true
  validates :location, :presence => true,
                      :length => {minimum: 4}


  def presentations_list
    unless presentations.empty?
      presentations.collect { |p| p.title }.join(', ')
    else
      'No presentations'
    end
  end


  # formatted name base on date
  def name
    meet_on.to_s(:long)
  end
end
