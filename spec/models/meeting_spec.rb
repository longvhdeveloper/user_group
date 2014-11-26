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

require 'rails_helper'

RSpec.describe Meeting, :type => :model do

  it "should find upcoming meetings" do
    meetings = Meeting.upcomming_meetings
    expect(meetings.size).to be > 0

    meetings.each do |meeting|
      expect(meeting.meets_on).to be > Time.zone.now.to_date
    end

  end

  it "should find past meetings" do
    meetings = Meeting.pastcomming_meetings
    expect(meetings.size).to be > 0

    meetings.each do |meeting|
      expect(meeting.meets_on).to be <= Time.zone.now.to_date
    end
  end

  it "should format date as name" do
    meeting = Meeting(:todays_meeting)
  end

end
