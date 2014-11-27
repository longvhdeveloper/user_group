class MeetingsController < ApplicationController

  before_filter :set_meeting, except: [:index, :new, :create]
  before_filter :admin_required, except: [:index, :show]

  def index
    unless read_fragment(:admin => is_admin?)
      @upcomming_meetings = Meeting.upcomming_meetings
    end
    @pastcomming_mettings = Meeting.pastcomming_meetings
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      flash[:notice] = "Meeting successfully created"
      redirect_to meetings_url
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update

    if @meeing.update_attributes(meeting_params)
      flash[:notice] = "Meeting successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @meeting.destroy
    expire_fragment(/\/meetings./)
    flash[:notice] = "Meeting successfully destroyed"
    redirect_to meetings_path
  end
  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:meet_on,
                                     :location,
                                     :description)
  end
end
