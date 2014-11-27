class PresentationsController < ApplicationController
  before_filter :set_meeting
  before_filter :set_presentation, :except => [:new, :create]
  before_filter :admin_required

  def new

  end

  def create
    @presentation = Presentation.new(presentation_params)

    if @meeting.presentations << @presentation
      redirect_to_meeting("Presentation successfully created.")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @presentation.update_attributes(presentation_params)
      redirect_to_meeting("Presentation successfully updated.")
    else
      render :edit
    end
  end

  def destroy
    @presentation.destroy
    redirect_to_meeting("Presentation successfully destroyed.")
  end

  private
  def set_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def set_presentation
    @presentation = @meeting.presentations.find(params[:id])
  end

  def presentation_params
    params.require(:presentation).permit(:user_id, :meeting_id, :title, :description)
  end

  def redirect_to_meeting(notice)
    flash[:notice] = notice
    redirect_to meeting_path(@meeting)
  end

end
