class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.by_starts_at.descending
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

end
