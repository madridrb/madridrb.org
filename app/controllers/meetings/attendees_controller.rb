class Meetings::AttendeesController < ApplicationController

  before_action :load_meeting


  def create
    authorize @meeting, :attend?
    @meeting.add_attendee(current_user)
    redirect_to @meeting
  end

  def destroy
    authorize @meeting, :unattend?
    @meeting.delete_attendee(current_user)
    redirect_to @meeting
  end

  private


  def load_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

end
