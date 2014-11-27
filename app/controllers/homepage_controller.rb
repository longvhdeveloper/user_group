class HomepageController < ApplicationController
  def index
    @meeting = Meeting.upcomming_meetings.first
  end
end
